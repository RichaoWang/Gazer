//
// Created by 12168 on 2024/4/21.
//

#ifndef GAZER_EXTERNALMANAGER_H
#define GAZER_EXTERNALMANAGER_H

#include "./CS2_External_Core/Cheats.h"
#include "./CS2_External_Core/Offsets.h"
#include "./CS2_External_Core/Utils/Initial/Init.h"
#include "./CS2_External_Core/MenuConfig.hpp"
#include <chrono>
#include <filesystem>
#include <iomanip>
#include <KnownFolders.h>
#include <ShlObj.h>
#include <stdio.h>
#include <QObject>
#include <mutex>

using namespace std;


class ExternalManager : public QObject {
Q_OBJECT

public:
    static ExternalManager *getInstance();

    Q_INVOKABLE QString init();

    Q_INVOKABLE bool getESPenabled();

    Q_INVOKABLE void setESPenabled(bool);

    Q_INVOKABLE bool getShowBoxESP();

    Q_INVOKABLE void setShowBoxESP(bool);

    Q_INVOKABLE bool getShowHeadBox();

    Q_INVOKABLE void setShowHeadBox(bool);

    Q_INVOKABLE bool getShowBoneESP();

    Q_INVOKABLE void setShowBoneESP(bool);

    Q_INVOKABLE bool getAimBot();

    Q_INVOKABLE void setAimBot(bool);

    Q_INVOKABLE bool getRage();

    Q_INVOKABLE void setRage(bool);

    Q_INVOKABLE int getAimBotHotKey();

    Q_INVOKABLE void setAimBotHotKey(int);

    Q_INVOKABLE bool getAimLock();

    Q_INVOKABLE void setAimLock(bool);

    Q_INVOKABLE bool getAutoShot();

    Q_INVOKABLE void setAutoShot(bool);

    Q_INVOKABLE bool getDrawFov();

    Q_INVOKABLE void setDrawFov(bool);

    Q_INVOKABLE float getAimFov();

    Q_INVOKABLE void setAimFov(float);

    Q_INVOKABLE std::vector<int> getHitBoxs();

    Q_INVOKABLE void addHitBox(int);

    Q_INVOKABLE void removeHitBox(int);


    Q_INVOKABLE bool getRCS();

    Q_INVOKABLE void setRCS(bool);

    Q_INVOKABLE float getRCSScaleX();

    Q_INVOKABLE void setRCSScaleX(float);

    Q_INVOKABLE float getRCSScaleY();

    Q_INVOKABLE void setRCSScaleY(float);


    Q_INVOKABLE bool getShowHealthBar();

    Q_INVOKABLE void setShowHealthBar(bool);


    Q_INVOKABLE bool getShowDistance();

    Q_INVOKABLE void setShowDistance(bool);

    Q_INVOKABLE bool getShowEyeRay();

    Q_INVOKABLE void setShowEyeRay(bool);


    Q_INVOKABLE bool getShowPlayerName();

    Q_INVOKABLE void setShowPlayerName(bool);
private:
    ExternalManager(QObject *parent = nullptr);

signals:

};


#endif //GAZER_EXTERNALMANAGER_H
