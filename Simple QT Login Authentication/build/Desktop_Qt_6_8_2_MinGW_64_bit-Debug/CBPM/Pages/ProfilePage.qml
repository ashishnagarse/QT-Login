import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: profilePage
    
    property string userEmail: ""
    property string userName: userEmail.split("@")[0]


    property var userData: {
        "name": userName,
        "email": userEmail,
        "role": "Administrator",
        "joinDate": "January 2024",
        "avatar": "../images/default-avatar.png"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Image {
            Layout.alignment: Qt.AlignHCenter
            source: profilePage.userData.avatar
            width: 120
            height: 120
            fillMode: Image.PreserveAspectFit
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: profilePage.userData.name
            font.pixelSize: 24
            font.bold: true
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: profilePage.userData.email
            font.pixelSize: 16
            color: "#666666"
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#DDDDDD"
        }

        GridLayout {
            Layout.fillWidth: true
            columns: 2
            rowSpacing: 10
            columnSpacing: 20

            Label {
                text: "Role:"
                font.bold: true
            }
            Label {
                text: profilePage.userData.role
            }

            Label {
                text: "Join Date:"
                font.bold: true
            }
            Label {
                text: profilePage.userData.joinDate
            }
        }
    }
} 
