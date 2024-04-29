#pragma once

#include "Game.h"
#include "Entity.h"
#include "Features\Aimbot\Legitbot.hpp"
#include "Features\Aimbot\Ragebot.hpp"
#include "TriggerBot.h"
#include "Features/Misc.h"

namespace Cheats {
    void RenderCrossHair(ImDrawList *drawList) noexcept;

    void Run();
}

struct {
    ImFont *normal15px = nullptr;
} fonts;