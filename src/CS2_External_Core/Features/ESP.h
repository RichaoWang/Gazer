#pragma once
#include "..\Render.hpp"
#include "..\MenuConfig.hpp"
#include "..\Cheats.h"
#include "GetWeaponIcon.h"
#define ICON_FA_EYE "\xef\x81\xae"

ID3D11ShaderResourceView* winniethepooh_srv = NULL;
int winnie_h = 0, winnie_w = 0;

namespace ESP
{
	ImVec4 GetBoxRect(const CEntity& Entity, int BoxType)
	{
		ImVec4 Rect;
		switch (BoxType)
		{
		case 0:
			Rect = Render::Get2DBox(Entity);
			break;
		case 1:
			Rect = Render::Get2DBoneRect(Entity);
			break;
		case 2:
			Rect = Render::Get2DBox(Entity);
			break;
		case 3:
			Rect = Render::Get2DBox(Entity);
			break;
		case 4:
			Rect = Render::Get2DBoneRect(Entity);
			break;
		default:
			break;
		}

		return Rect;
	}

	void RenderPlayerESP(const CEntity& LocalEntity, const CEntity& Entity, ImVec4 Rect, int LocalPlayerControllerIndex, int Index)
	{
		std::string weaponIcon = GunIcon(Entity.Pawn.WeaponName);

		Render::DrawBone(Entity, ESPConfig::BoneColor, 1.3f);
		Render::ShowPenis(Entity, ESPConfig::PenisLength, ESPConfig::PenisColor, ESPConfig::PenisSize);
		Render::ShowLosLine(Entity, 50.0f, ESPConfig::EyeRayColor, 1.3f);
		Render::DrawHeadCircle(Entity, ESPConfig::HeadBoxColor);

		if (ESPConfig::ShowBoxESP)
		{	
			if (MenuConfig::BoxType == 0 || MenuConfig::BoxType == 1)
			{
				if (ESPConfig::OutLine)
					Gui.Rectangle({ Rect.x,Rect.y }, { Rect.z,Rect.w }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3, ESPConfig::BoxRounding);

				if (((Entity.Pawn.bSpottedByMask & (DWORD64(1) << LocalPlayerControllerIndex)) || (LocalEntity.Pawn.bSpottedByMask & (DWORD64(1) << Index))) && ESPConfig::VisibleCheck)
				{
					Gui.Rectangle({ Rect.x,Rect.y }, { Rect.z,Rect.w }, ESPConfig::VisibleColor, 1.3, ESPConfig::BoxRounding);
				}
				else {
					Gui.Rectangle({ Rect.x,Rect.y }, { Rect.z,Rect.w }, ESPConfig::BoxColor, 1.3, ESPConfig::BoxRounding);
				}
			}
			else if (MenuConfig::BoxType == 2 || MenuConfig::BoxType == 3)
			{
				//Outline
				Gui.Line({ Rect.x, Rect.y }, { Rect.x + Rect.z * 0.25f, Rect.y }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x, Rect.y }, { Rect.x, Rect.y + Rect.w * 0.25f }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x + Rect.z, Rect.y + Rect.w }, { Rect.x + Rect.z - Rect.z * 0.25f, Rect.y + Rect.w }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x + Rect.z, Rect.y + Rect.w }, { Rect.x + Rect.z, Rect.y + Rect.w - Rect.w * 0.25f }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x, Rect.y + Rect.w }, { Rect.x + Rect.z * 0.25f, Rect.y + Rect.w }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x, Rect.y + Rect.w }, { Rect.x, Rect.y + Rect.w - Rect.w * 0.25f }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x + Rect.z, Rect.y }, { Rect.x + Rect.z - Rect.z * 0.25f, Rect.y }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);
				Gui.Line({ Rect.x + Rect.z, Rect.y }, { Rect.x + Rect.z, Rect.y + Rect.w * 0.25f }, ESPConfig::BoxColor & IM_COL32_A_MASK, 3);

				// Main Box Lines
				if (((Entity.Pawn.bSpottedByMask & (DWORD64(1) << LocalPlayerControllerIndex)) || (LocalEntity.Pawn.bSpottedByMask & (DWORD64(1) << Index))) && ESPConfig::VisibleCheck)
				{
					Gui.Line({ Rect.x, Rect.y }, { Rect.x + Rect.z * 0.25f, Rect.y }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x, Rect.y }, { Rect.x, Rect.y + Rect.w * 0.25f }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y }, { Rect.x + Rect.z - Rect.z * 0.25f, Rect.y }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y }, { Rect.x + Rect.z, Rect.y + Rect.w * 0.25f }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x, Rect.y + Rect.w }, { Rect.x + Rect.z * 0.25f, Rect.y + Rect.w }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x, Rect.y + Rect.w }, { Rect.x, Rect.y + Rect.w - Rect.w * 0.25f }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y + Rect.w }, { Rect.x + Rect.z - Rect.z * 0.25f, Rect.y + Rect.w }, ESPConfig::VisibleColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y + Rect.w }, { Rect.x + Rect.z, Rect.y + Rect.w - Rect.w * 0.25f }, ESPConfig::VisibleColor, 1.3f);
				}
				else {
					Gui.Line({ Rect.x, Rect.y }, { Rect.x + Rect.z * 0.25f, Rect.y }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x, Rect.y }, { Rect.x, Rect.y + Rect.w * 0.25f }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y }, { Rect.x + Rect.z - Rect.z * 0.25f, Rect.y }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y }, { Rect.x + Rect.z, Rect.y + Rect.w * 0.25f }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x, Rect.y + Rect.w }, { Rect.x + Rect.z * 0.25f, Rect.y + Rect.w }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x, Rect.y + Rect.w }, { Rect.x, Rect.y + Rect.w - Rect.w * 0.25f }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y + Rect.w }, { Rect.x + Rect.z - Rect.z * 0.25f, Rect.y + Rect.w }, ESPConfig::BoxColor, 1.3f);
					Gui.Line({ Rect.x + Rect.z, Rect.y + Rect.w }, { Rect.x + Rect.z, Rect.y + Rect.w - Rect.w * 0.25f }, ESPConfig::BoxColor, 1.3f);
				}
			}
			if (ESPConfig::winniethepool && MenuConfig::Country == "CN") {
				if (winniethepooh_srv == nullptr) {
//					Gui.LoadTextureFromMemory(winniethepooh_image, sizeof winniethepooh_image, &winniethepooh_srv, &winnie_h, &winnie_w);
				}
				ImGui::GetBackgroundDrawList()->AddImage(winniethepooh_srv, ImVec2(Rect.x,Rect.y), { ImVec2(Rect.x,Rect.y).x+ImVec2(Rect.z,Rect.w).x,ImVec2(Rect.x,Rect.y).y + ImVec2(Rect.z,Rect.w).y });
			}
		}


		Render::LineToEnemy(Rect, ESPConfig::LineToEnemyColor, 1.2);

		if (ESPConfig::ShowPlayerName)
		{
			if (MenuConfig::HealthBarType == 0)
				Gui.StrokeText(Entity.Controller.PlayerName, { Rect.x + Rect.z / 2,Rect.y - 14 }, ImColor(255, 255, 255, 255), 14, true);
			else
				Gui.StrokeText(Entity.Controller.PlayerName, { Rect.x + Rect.z / 2,Rect.y - 13 - 14 }, ImColor(255, 255, 255, 255), 14, true);
		}
	}
}