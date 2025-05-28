import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import CBPM

Page {
    id: settingsPage

    property var settings: {
        "notifications": true,
        "darkMode": false,
        "language": "English",
        "autoSync": true
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        Label {
            text: "Settings"
            font.pixelSize: 24
            font.bold: true
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#DDDDDD"
        }

        // Notifications Setting
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "Notifications"
                Layout.fillWidth: true
            }
            Switch {
                checked: settingsPage.settings.notifications
            }
        }

        // Dark Mode Setting
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "Dark Mode"
                Layout.fillWidth: true
            }
            Switch {
                checked: settingsPage.settings.darkMode
            }
        }

        // Language Setting
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "Language"
                Layout.fillWidth: true
            }
            ComboBox {
                model: ["English", "Spanish", "French", "German"]
                currentIndex: 0
            }
        }

        // Auto Sync Setting
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "Auto Sync"
                Layout.fillWidth: true
            }
            Switch {
                checked: settingsPage.settings.autoSync
            }
        }

        Item {
            Layout.fillHeight: true
        }

        CustomButton {
            text: "Save Changes"
            Layout.fillWidth: true
        }
    }
} 
