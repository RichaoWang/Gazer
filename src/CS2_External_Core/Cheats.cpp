#include <string>
#include <thread>
#include <future>
#include <iostream>

#include "Cheats.h"
#include "Render.hpp"
#include "MenuConfig.hpp"

#include "Utils/Initial/Init.h"

#include "Features/ESP.h"
#include "Features/RCS.H"
#include "Features/BombTimer.h"
#include "Features/SpectatorList.h"

int PreviousTotalHits = 0;

void Cheats::RenderCrossHair(ImDrawList *drawList) noexcept {
    if (!CrosshairsCFG::ShowCrossHair)
        return;

    if (CrosshairsCFG::isAim && MenuConfig::TargetingCrosshairs)
        Render::DrawCrossHair(drawList, ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2),
                              ImGui::ColorConvertFloat4ToU32(CrosshairsCFG::TargetedColor));
    else
        Render::DrawCrossHair(drawList, ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2),
                              ImGui::ColorConvertFloat4ToU32(CrosshairsCFG::CrossHairColor));
}

void Cheats::Run() {
    static DWORD lastTick = 0;
    DWORD currentTick = GetTickCount();

    // cs2的窗口是否激活状态
    if (!Init::Client::isGameWindowActive())
        return;

    // Update matrix  更新地址
    if (!ProcessMgr.ReadMemory(gGame.GetMatrixAddress(), gGame.View.Matrix, 64))
        return;

    // Update EntityList Entry
    gGame.UpdateEntityListEntry();

    DWORD64 LocalControllerAddress = 0;
    DWORD64 LocalPawnAddress = 0;

    if (!ProcessMgr.ReadMemory(gGame.GetLocalControllerAddress(), LocalControllerAddress))
        return;
    if (!ProcessMgr.ReadMemory(gGame.GetLocalPawnAddress(), LocalPawnAddress))
        return;

    // LocalEntity
    CEntity LocalEntity, ServerEntity;
    static int LocalPlayerControllerIndex = 1;
    LocalEntity.UpdateClientData();
    if (!LocalEntity.UpdateController(LocalControllerAddress))
        return;
    if (!LocalEntity.UpdatePawn(LocalPawnAddress) && !MiscCFG::WorkInSpec)
        return;

    // HealthBar Map
    static std::map<DWORD64, Render::HealthBar> HealthBarMap;

    // AimBot data
    float DistanceToSight = 0;
    float MaxAimDistance = 100000;
    Vec3 HeadPos{0, 0, 0};
    Vec2 Angles{0, 0};
    std::vector<Vec3> AimPosList;

    for (int i = 0; i < 64; i++) {
        CEntity Entity;
        DWORD64 EntityAddress = 0;
        if (!ProcessMgr.ReadMemory<DWORD64>(gGame.GetEntityListEntry() + (i + 1) * 0x78, EntityAddress))
            continue;
        if (EntityAddress == LocalEntity.Controller.Address) {
            LocalPlayerControllerIndex = i;
            continue;
        }
        if (!Entity.UpdateController(EntityAddress))
            continue;
        if (!Entity.UpdatePawn(Entity.Pawn.Address))
            continue;

        if (MenuConfig::TeamCheck && Entity.Controller.TeamID == LocalEntity.Controller.TeamID)
            continue;

        if (!Entity.IsAlive())
            continue;

        if (!Entity.IsInScreen())
            continue;

        //update Bone select
        if (AimControl::HitboxList.size() != 0) {
            for (int i = 0; i < AimControl::HitboxList.size(); i++) {
                Vec3 TempPos;
                DistanceToSight = Entity.GetBone().BonePosList[AimControl::HitboxList[i]].ScreenPos.DistanceTo(
                        {Gui.Window.Size.x / 2, Gui.Window.Size.y / 2});

                if (DistanceToSight < MaxAimDistance) {
                    MaxAimDistance = DistanceToSight;

                    if (!MenuConfig::VisibleCheck ||
                        Entity.Pawn.bSpottedByMask & (DWORD64(1) << (LocalPlayerControllerIndex)) ||
                        LocalEntity.Pawn.bSpottedByMask & (DWORD64(1) << (i))) {
                        TempPos = Entity.GetBone().BonePosList[AimControl::HitboxList[i]].Pos;
                        if (AimControl::HitboxList[i] == BONEINDEX::head)
                            TempPos.z -= 1.f;

                        AimPosList.push_back(TempPos);
                    }
                }
            }
        }

        // ESP相关绘制
        if (ESPConfig::ESPenabled) {
            ImVec4 Rect = ESP::GetBoxRect(Entity, MenuConfig::BoxType);
            int distance = static_cast<int>(Entity.Pawn.Pos.DistanceTo(LocalEntity.Pawn.Pos) / 100);

            if (ESPConfig::RenderDistance == 0 ||
                (distance <= ESPConfig::RenderDistance && ESPConfig::RenderDistance > 0)) {
                // draw
                ESP::RenderPlayerESP(LocalEntity, Entity, Rect, LocalPlayerControllerIndex, i);
                Render::DrawDistance(LocalEntity, Entity, Rect);

                // Draw HealthBar
                if (ESPConfig::ShowHealthBar) {
                    ImVec2 HealthBarPos = {Rect.x - 6.f, Rect.y};
                    ImVec2 HealthBarSize = {4, Rect.w};
                    Render::DrawHealthBar(EntityAddress, 100, Entity.Pawn.Health, HealthBarPos, HealthBarSize);
                }

                // Draw Ammo
                // When player is using knife or nade, Ammo = -1.
                if (ESPConfig::AmmoBar && Entity.Pawn.Ammo != -1) {
                    ImVec2 AmmoBarPos = {Rect.x, Rect.y + Rect.w + 2};
                    ImVec2 AmmoBarSize = {Rect.z, 4};
                    Render::DrawAmmoBar(EntityAddress, Entity.Pawn.MaxAmmo, Entity.Pawn.Ammo, AmmoBarPos, AmmoBarSize);
                }

                // Draw Armor
                // It is meaningless to render a empty bar
                if (ESPConfig::ArmorBar && Entity.Pawn.Armor > 0) {
                    bool HasHelmet;
                    ImVec2 ArmorBarPos;
                    ProcessMgr.ReadMemory(Entity.Controller.Address + Offset::PlayerController.HasHelmet, HasHelmet);
                    ArmorBarPos = {Rect.x + Rect.z + 2.f, Rect.y};
                    ImVec2 ArmorBarSize = {4.f, Rect.w};
                    Render::DrawArmorBar(EntityAddress, 100, Entity.Pawn.Armor, HasHelmet, ArmorBarPos, ArmorBarSize);
                }
            }
        }
        // Glow::Run(Entity);
        // Misc::SpectatorList(LocalEntity, Entity);
    }


    // TriggerBot
    if (MenuConfig::TriggerBot && (GetAsyncKeyState(TriggerBot::HotKey) || MenuConfig::TriggerAlways))
        TriggerBot::Run(LocalEntity);

    Misc::HitManager(LocalEntity, PreviousTotalHits);
    Misc::HitMarker(30.f, 10.f);
    Misc::FlashImmunity(LocalEntity);
    Misc::FastStop();
    Misc::FovChanger(LocalEntity);
    Misc::Watermark(LocalEntity);
    Misc::FakeDuck(LocalEntity);
    Misc::BunnyHop(LocalEntity);
    Misc::CheatList();
    Misc::ForceScope(LocalEntity);
    Misc::JumpThrow(LocalEntity);


    // Fov line
    Render::DrawFov(LocalEntity, MenuConfig::FovLineSize, MenuConfig::FovLineColor, 1);

    // HeadShoot Line
    Render::HeadShootLine(LocalEntity, MenuConfig::HeadShootLineColor);

    // CrossHair
    TriggerBot::TargetCheck(LocalEntity);
    Misc::AirCheck(LocalEntity);
    RenderCrossHair(ImGui::GetBackgroundDrawList());

    bmb::RenderWindow();

    // Aimbot
    if (MenuConfig::AimBot) {
        Render::DrawFovCircle(LocalEntity);

        if (MenuConfig::AimAlways || GetAsyncKeyState(AimControl::HotKey)) {
            if (AimPosList.size() != 0) {
                if (AimControl::Rage && !MenuConfig::SafeMode)
                    AimControl::Ragebot(LocalEntity, LocalEntity.Pawn.CameraPos, AimPosList);
                else
                    AimControl::AimBot(LocalEntity, LocalEntity.Pawn.CameraPos, AimPosList);
            }
        }

        if (MenuConfig::AimToggleMode && (GetAsyncKeyState(AimControl::HotKey) & 0x8000) &&
            currentTick - lastTick >= 200) {
            AimControl::switchToggle();
            lastTick = currentTick;
        }
    }

    if (!AimControl::AimBot || !AimControl::HasTarget)
        RCS::RecoilControl(LocalEntity);


    int currentFPS = static_cast<int>(ImGui::GetIO().Framerate);
    if (currentFPS > MenuConfig::MaxRenderFPS) {
        int FrameWait = round(1000.0 / MenuConfig::MaxRenderFPS);
        std::this_thread::sleep_for(std::chrono::milliseconds(FrameWait));
    }
}
