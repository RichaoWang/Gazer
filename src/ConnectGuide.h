//
// Created by 12168 on 2024/4/16.
//

#ifndef GAZER_CONNECTGUIDE_H
#define GAZER_CONNECTGUIDE_H
#include <QObject>

class ConnectGuide: public QObject
{
Q_OBJECT

public:
    ConnectGuide(QObject *parent = nullptr);

    static ConnectGuide* instance();


//    Q_INVOKABLE QByteArray bootUniqueId();
//    Q_INVOKABLE QString buildAbi();
//    Q_INVOKABLE QString buildCpuArchitecture();
//    Q_INVOKABLE QString currentCpuArchitecture();
//    Q_INVOKABLE QString kernelType();
//    Q_INVOKABLE QString kernelVersion();
//    Q_INVOKABLE QString machineHostName();
//    Q_INVOKABLE QByteArray machineUniqueId();
//    Q_INVOKABLE QString prettyProductName();
//    Q_INVOKABLE QString productType();
//    Q_INVOKABLE QString productVersion();

//    Q_INVOKABLE QString getText();

signals:
//    void signalGetSystemInfo();//const QJsonObject &jsonObject


private:

};


#endif //GAZER_CONNECTGUIDE_H
