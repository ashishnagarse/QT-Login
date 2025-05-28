#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_CBPM_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Utils_CustomInput_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Utils_CustomCheckBox_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Utils_CustomButton_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Pages_LoginPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Pages_LandingPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Pages_ProfilePage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Pages_SettingsPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Pages_MessagesPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_CBPM_Pages_AnalyticsPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Main.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Utils/CustomInput.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Utils_CustomInput_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Utils/CustomCheckBox.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Utils_CustomCheckBox_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Utils/CustomButton.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Utils_CustomButton_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Pages/LoginPage.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Pages_LoginPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Pages/LandingPage.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Pages_LandingPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Pages/ProfilePage.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Pages_ProfilePage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Pages/SettingsPage.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Pages_SettingsPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Pages/MessagesPage.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Pages_MessagesPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/CBPM/Pages/AnalyticsPage.qml"), &QmlCacheGeneratedCode::_qt_qml_CBPM_Pages_AnalyticsPage_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appCBPM)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appCBPM))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appCBPM)() {
    return 1;
}
