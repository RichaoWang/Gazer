//
// Created by 12168 on 2024/4/16.
//

#include "ConnectGuide.h"
static ConnectGuide* __ConnectGuide = nullptr;


ConnectGuide::ConnectGuide(QObject *parent)
        :QObject(parent)
{

}

ConnectGuide *ConnectGuide::instance()
{
    if(__ConnectGuide == nullptr){
        __ConnectGuide = new ConnectGuide();
    }
    return __ConnectGuide;
}

//QByteArray ConnectGuide::bootUniqueId()
//{
//    return QSysInfo::bootUniqueId();
//}
//
//QString ConnectGuide::buildAbi()
//{
//    return QSysInfo::buildAbi();
//}
//
//QString ConnectGuide::buildCpuArchitecture()
//{
//    return QSysInfo::buildCpuArchitecture();
//}
//
//QString ConnectGuide::currentCpuArchitecture()
//{
//    return QSysInfo::currentCpuArchitecture();
//}
//
//QString ConnectGuide::kernelType()
//{
//    return QSysInfo::kernelType();
//}
//
//QString ConnectGuide::kernelVersion()
//{
//    return QSysInfo::kernelVersion();
//}
//
//QString ConnectGuide::machineHostName()
//{
//    return QSysInfo::machineHostName();
//}
//
//QByteArray ConnectGuide::machineUniqueId()
//{
//    return QSysInfo::machineUniqueId();
//}
//
//QString ConnectGuide::prettyProductName()
//{
//    return QSysInfo::prettyProductName();
//}
//
//QString ConnectGuide::productType()
//{
//    return QSysInfo::productType();
//}
//
//QString ConnectGuide::productVersion()
//{
//    return QSysInfo::productVersion();
//}
//
//QString ConnectGuide::getText()
//{
//    return QString("camle");
//}
