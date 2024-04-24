//
// Created by 12168 on 2024/4/21.
//

#include "ExternalManager.h"

static ExternalManager *__ExternalManager = nullptr;


ExternalManager::ExternalManager(QObject *parent)
        : QObject(parent) {

}

ExternalManager *ExternalManager::getInstance() {
    if (__ExternalManager == nullptr) {
        __ExternalManager = new ExternalManager();
    }
    return __ExternalManager;
}

DWORD WINAPI MyThreadFunction(LPVOID lpParam) {
    // 线程执行的代码
    Gui.AttachAnotherWindow("Counter-Strike 2", "SDL_app", Cheats::Run);
}

QString ExternalManager::init() {
    MenuConfig::HWID = Init::Client::GenerateHWID();
    if (Init::Verify::CheckWindowVersion()) {
        Lang::GetCountry(MenuConfig::Country);
        MenuConfig::MaxFrameRate = Init::Client::getMaxFrameRate();
    }

    // 获取csgo2进程
    auto ProcessStatus = ProcessMgr.Attach("cs2.exe");

    // 获取配置文件保存路径
    char documentsPath[MAX_PATH];
    if (SHGetFolderPathA(NULL, CSIDL_PERSONAL, NULL, 0, documentsPath) != S_OK) {
        return QString("获取文档路径错误。");
    }
    MenuConfig::path = documentsPath;
    MenuConfig::path += "\\Gazer";

    if (ProcessStatus == 1) {
        return QString("请先启动游戏，再启动Gazer。");
    } else if (ProcessStatus == 2) {
        return QString("进程Hook失败，请右键以管理员身份运行该应用。");

    } else if (ProcessStatus == 3) {
        return QString("模块地址获取失败。");
    }

    if (!Offset::UpdateOffsets()) {
        return QString("更新Offsets失败。");
    }

    if (!gGame.InitAddress()) {
        return QString("调用InitAddress()失败。");
    }

    cout << "[游戏] Process ID（进程ID）: " << ProcessMgr.ProcessID << endl;
    cout << "[游戏] Client Address（客户端地址）: " << gGame.GetClientDLLAddress() << endl;


    cout << endl;
    cout << "=======[ Offset List ]=======" << endl;
    cout << setw(23) << left << "EntityList:" << setiosflags(ios::uppercase) << hex << Offset::EntityList << endl;
    cout << setw(23) << left << "Matrix:" << setiosflags(ios::uppercase) << hex << Offset::Matrix << endl;
    cout << setw(23) << left << "LocalPlayerController:" << setiosflags(ios::uppercase) << hex
         << Offset::LocalPlayerController << endl;
    cout << setw(23) << left << "ViewAngles:" << setiosflags(ios::uppercase) << hex << Offset::ViewAngle << endl;
    cout << setw(23) << left << "LocalPlayerPawn:" << setiosflags(ios::uppercase) << hex << Offset::LocalPlayerPawn
         << endl;
    cout << setw(23) << left << "PlantedC4:" << setiosflags(ios::uppercase) << hex << Offset::PlantedC4 << endl;
    cout << setw(23) << left << "ForceJump:" << setiosflags(ios::uppercase) << hex << Offset::ForceJump << endl;
    cout << setw(23) << left << "Sensitivity:" << setiosflags(ios::uppercase) << hex << Offset::Sensitivity << endl;
    cout << endl;

    HANDLE hThread = CreateThread(NULL, 0, MyThreadFunction, NULL, 0, NULL);

//    Cheats::Run();
//    Gui.AttachAnotherWindow("Counter-Strike 2", "SDL_app", Cheats::Run);

//    // gui嵌入游戏
//    try {
//        // 官服
//        std::cout<<"官服"<<std::endl;
//        Gui.AttachAnotherWindow("Counter-Strike 2", "SDL_app", Cheats::Run);
//    }
//    catch (OSImGui::OSException &e) {
//        // 完美服
//        try {
//            // Perfect World version
//            std::cout<<"完美服"<<std::endl;
//            Gui.AttachAnotherWindow("反恐精英：全球攻势", "SDL_app", Cheats::Run);
//        }
//        catch (OSImGui::OSException &e) {
////            cout << e.what() << endl;
//            return QString(e.what());
//        }
//    }

    return QString("");
}

bool ExternalManager::getESPenabled() {
    return ESPConfig::ESPenabled;
}

void ExternalManager::setESPenabled(bool flag) {
    ESPConfig::ESPenabled = flag;
}

bool ExternalManager::getShowBoxESP() {
    return ESPConfig::ShowBoxESP;
}

void ExternalManager::setShowBoxESP(bool flag) {
    ESPConfig::ShowBoxESP = flag;
}

bool ExternalManager::getShowHeadBox() {
    return ESPConfig::ShowHeadBox;
}

void ExternalManager::setShowHeadBox(bool flag) {
    ESPConfig::ShowHeadBox = flag;
}

bool ExternalManager::getShowBoneESP() {
    return ESPConfig::ShowBoneESP;
}

void ExternalManager::setShowBoneESP(bool flag) {
    ESPConfig::ShowBoneESP = flag;
}

bool ExternalManager::getAimBot() {
    return MenuConfig::AimBot;
}

void ExternalManager::setAimBot(bool flag) {
    MenuConfig::AimBot = flag;
}

bool ExternalManager::getRage() {
    return AimControl::Rage;
}

void ExternalManager::setRage(bool flag) {
    AimControl::Rage = flag;
}

int ExternalManager::getAimBotHotKey() {
    return MenuConfig::AimBotHotKey;
}

void ExternalManager::setAimBotHotKey(int key) {
    MenuConfig::AimBotHotKey = key;
}

bool ExternalManager::getAimLock() {
    return AimControl::AimLock;
}

void ExternalManager::setAimLock(bool f) {
    AimControl::AimLock = f;
}

bool ExternalManager::getAutoShot() {
    return AimControl::AutoShot;
}

void ExternalManager::setAutoShot(bool f) {
    AimControl::AutoShot = f;
}

bool ExternalManager::getDrawFov() {
    return ESPConfig::DrawFov;
}

void ExternalManager::setDrawFov(bool f) {
    ESPConfig::DrawFov = f;
}

float ExternalManager::getAimFov() {
    return AimControl::AimFov;
}

void ExternalManager::setAimFov(float f) {
    f = std::round(f * 10.0f) / 10.0f;
    AimControl::AimFov = f;
}

std::vector<int> ExternalManager::getHitBoxs() {
    return AimControl::HitboxList;
}

void ExternalManager::addHitBox(int idx) {
    AimControl::HitboxList.push_back(idx);
}

void ExternalManager::removeHitBox(int idx) {
    for (auto it = AimControl::HitboxList.begin(); it != AimControl::HitboxList.end(); ++it) {
        if (*it == idx) {
            AimControl::HitboxList.erase(it);
            break;
        }
    }
}

bool ExternalManager::getRCS() {
    return MenuConfig::RCS;
}

void ExternalManager::setRCS(bool f) {
    MenuConfig::RCS = f;
}

float ExternalManager::getRCSScaleY() {
    return RCS::RCSScale.y;
}

float ExternalManager::getRCSScaleX() {
    return RCS::RCSScale.x;
}

void ExternalManager::setRCSScaleX(float v) {
    v = std::round(v * 10.0f) / 10.0f;
    RCS::RCSScale.x = v;
}

void ExternalManager::setRCSScaleY(float v) {
    v = std::round(v * 10.0f) / 10.0f;
    RCS::RCSScale.y = v;
}
