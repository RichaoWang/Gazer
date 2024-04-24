#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ExternalManager.h"


int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // load external core
    ExternalManager *external_manager = ExternalManager::getInstance();
    engine.rootContext()->setContextProperty("ExternalManager", external_manager);

    const QUrl url(QStringLiteral("qrc:/qml/App.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
