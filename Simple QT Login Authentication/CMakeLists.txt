cmake_minimum_required(VERSION 3.16)

project(CBPM VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appCBPM
    main.cpp
    database.h
    database.cpp
)

qt_add_qml_module(appCBPM
    URI CBPM
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES Images.qrc
        QML_FILES Utils/CustomInput.qml
        QML_FILES Utils/CustomCheckBox.qml
        QML_FILES Utils/CustomButton.qml
        QML_FILES Pages/LoginPage.qml
        QML_FILES Pages/LandingPage.qml
        QML_FILES Pages/ProfilePage.qml
        QML_FILES Pages/SettingsPage.qml
        QML_FILES Pages/MessagesPage.qml
        QML_FILES Pages/AnalyticsPage.qml
        SOURCES Database.h Database.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCBPM PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCBPM
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCBPM
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appCBPM
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
