#pragma once

#include "Bone.h"
#include "Game.h"
#include "Utils/Random.h"

namespace MenuConfig {
    inline std::string path = "";
    // Don't change this
//    inline std::string Key = "N5ZF3KG8H6BVQ71T";
    inline std::string HWID = "";

    inline std::string Country = "";
    inline int MaxFrameRate = 60;
    inline bool defaultConfig = false;
    inline int Language = 0;
    inline bool SafeMode = false;
    inline int MaxRenderFPS = 144;

    // 0: Window 1: Collapse
    inline int WindowStyle = 0;

    inline bool AimBot = true;  // 自瞄
    inline bool AimAlways = false;
    inline bool AimToggleMode = true;
    inline int AimBotHotKey = 1;
    // 0: head 1: neck 3: spine
    inline int AimPosition = 0;
    inline DWORD AimPositionIndex = BONEINDEX::head;
    inline bool VisibleCheck = true;

    inline bool RCS = true;
    inline bool Bhop = false;

    // 0: normal 1: dynamic 2: Flat
    inline int BoxType = 2;
    // 0: Vertical 1: Horizontal
    inline int HealthBarType = 0;

    inline ImColor FovCircleColor = ImColor(255, 255, 255, 255);

    inline bool TriggerBot = false;
    inline bool TriggerAlways = false;
    inline int TriggerHotKey = 0;

    inline bool TeamCheck = true;

    inline bool ShowHeadShootLine = false;
    //inline ImColor HeadShootLineColor = ImColor(255, 255, 255, 200);
    inline ImColor HeadShootLineColor = ImColor(255, 0, 255, 200);

    inline bool ShowFovLine = false;
    inline ImColor FovLineColor = ImColor(55, 55, 55, 220);
    inline float FovLineSize = 60.f;

    inline bool BypassOBS = false;
    inline bool TargetingCrosshairs = false;
    inline bool HitboxUpdated = false;

}

namespace ESPConfig {
    inline bool ESPenabled = true;  // esp开启
    inline bool AmmoBar = false;
    inline bool ShowScoping = false;
    inline bool ShowBoneESP = true;  // 骨架
    inline bool ShowBoxESP = true;  // 包围框
    inline bool winniethepool = false;
    inline bool ShowHealthBar = true;
    inline bool ShowEyeRay = true;
    inline bool ShowPlayerName = true;
    inline bool DrawFov = true;
    inline bool ShowDistance = true;
    inline bool ShowHealthNum = false;
    inline bool ArmorBar = false;
    inline bool ShowArmorNum = false;
    inline bool ShowHeadBox = false;  // 头 显示
    inline bool VisibleCheck = false;
    inline bool OutLine = true;
    // 0: normal 1: Flat
    inline int HeadBoxStyle = 0;
    inline float BoxRounding = RandomPara<float>(0.0f, 3.0f);;
    inline float BoxAlpha = 0.35f;
    inline bool ShowLineToEnemy = false;
    inline int RenderDistance = 0;
    inline ImColor LineToEnemyColor = ImColor(255, 255, 255, 220);
    // 0: Top 1: Center 2: Bottom
    inline int LinePos = 0;

    inline ImColor BoneColor = ImColor(124, 178, 217, 255);
    inline ImColor BoxColor = ImColor(32, 178, 170, 255);
    inline ImColor EyeRayColor = ImColor(255, 0, 0, 255);
    inline ImColor HeadBoxColor = ImColor(197, 138, 163, 255);
    inline ImColor VisibleColor = ImColor(255, 196, 0, 255);

    // Penis Config
    inline bool ShowPenis = false;
    inline float PenisLength = RandomPara<float>(3.0f, 15.0f);
    inline float PenisSize = RandomPara<float>(1.3f, 3.0f);
    inline ImColor PenisColor = ImColor(255, 0, 0, 200);
}

namespace DebuggerConfig {
    inline bool Debug = false;
}

namespace CrosshairsCFG {
    inline float CrossHairSize = 75;

    inline bool ShowCrossHair = false;
    inline bool drawDot = true;
    inline bool drawCrossline = true;
    inline bool tStyle = false;
    inline bool drawCircle = false;
    inline bool drawOutLine = true;
    inline bool DynamicGap = false;
    inline bool TeamCheck = true;

    inline int crosshairPreset = 0;
    inline int Gap = 8;
    inline int HorizontalLength = 6;
    inline int VerticalLength = 6;
    inline int Thickness = 1.0f;
    inline float DotSize = 1.0f;
    inline float CircleRadius = 3.f;

    inline bool isAim = false;
    inline bool isJump = false;

    inline ImColor CrossHairColor = ImColor(0, 255, 0, 255);
    inline ImColor TargetedColor = ImColor(255, 0, 0, 255);
}

namespace MiscCFG {
    inline bool BunnyHop = false;
    inline bool WorkInSpec = true;
    inline bool WaterMark = false;
    inline bool SkinChanger = false;
    inline bool bmbTimer = false;
    inline bool FastStop = false;
    inline bool SpecList = false;
    inline bool EnemySensor = false;
    inline bool RadarHack = true;
    inline bool MoneyService = false;
    inline bool ShowCashSpent = false;
    inline bool NoSmoke = false;
    inline bool SmokeColored = false;
    inline bool FireColored = false;
    inline bool FovHacker = false;
    inline bool CheatList = false;
    inline bool ForceScope = false;
    inline bool NightMode = false;
    inline bool jumpthrow = false;
    inline int NightModeAlpha = 0.f;
    inline int Fov = 90;
    inline float FlashImmunity = 0;
    inline bool HitMarker = false;

    inline ImColor BombTimerCol = ImColor(255, 120, 0, 255);
    inline ImColor SmokeColor = ImColor(255, 0, 0, 255);
    inline ImColor FireColor = ImColor(0, 255, 0, 255);

    inline bool Jitter = false;
}
