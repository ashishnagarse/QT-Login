import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import CBPM

Window {
    id: mainWindow
    visible: true
    width: 400
    height: 700
    title: qsTr("Login App")

    // flags: Qt.window | Qt.FramelessWindowHint
    // color: "transparent"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage
    }

    Component {
        id: loginPage
        LoginPage {
            onLoginSuccessful: function(email) {
                stackView.replace(landingPage.createObject(stackView, { userEmail: email }))
            }
        }
    }

    Component {
        id: landingPage
        LandingPage {
            onLogout: {
                stackView.replace(loginPage.createObject(stackView))

            }
        }
    }

    Action {
        shortcut: "Ctrl+q"
        onTriggered: Qt.quit()
    }
}
