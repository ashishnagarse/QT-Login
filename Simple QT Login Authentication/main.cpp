#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Database.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Database database;

    QQmlApplicationEngine engine;

    // Register Database class with QML
    engine.rootContext()->setContextProperty("database", &database);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []()
        { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("CBPM", "Main");

    return app.exec();
}
