import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import CBPM

Page {
    id: landingPage
    background: null

    signal logout()
    property string userEmail: ""

    Rectangle {
        anchors.fill: parent
        color: "#fafafa"
        radius: 40

        ColumnLayout {
            anchors {
                fill: parent
                margins: 20
            }
            spacing: 15

            // Header section
            Rectangle {
                Layout.fillWidth: true
                height: 60
                color: "#ff3951"
                radius: 15

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Label {
                        text: "Welcome"
                        color: "white"
                        font {
                            pointSize: 16
                            weight: Font.DemiBold
                        }
                    }

                    Item { Layout.fillWidth: true }

                    CustomButton {
                        text: "Back"
                        visible: contentStack.depth > 1
                        onClicked: contentStack.pop()
                    }

                    CustomButton {
                        text: "Logout"
                        onClicked: landingPage.logout()
                    }
                }
            }

            StackView {
                id: contentStack
                Layout.fillWidth: true
                Layout.fillHeight: true
                initialItem: dashboardComponent
            }
        }
    }

    // Dashboard Component
    Component {
        id: dashboardComponent

        ColumnLayout {
            spacing: 15

            Label {
                text: "Dashboard"
                color: "#1a1a1a"
                font {
                    pointSize: 24
                    weight: Font.Bold
                }
            }

            Label {
                text: "Logged in as: " + userEmail
                color: "#777"
                font.pointSize: 12
            }

            GridLayout {
                Layout.fillWidth: true
                columns: 2
                columnSpacing: 15
                rowSpacing: 15

                Repeater {
                    model: [
                        { name: "Profile", color: "#4CAF50" },
                        { name: "Settings", color: "#2196F3" },
                        { name: "Messages", color: "#FF9800" },
                        { name: "Analytics", color: "#9C27B0" }
                    ]

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120
                        radius: 15
                        color: modelData.color
                        opacity: 0.9

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 10

                            Label {
                                text: modelData.name
                                color: "white"
                                font {
                                    pointSize: 14
                                    weight: Font.DemiBold
                                }
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                switch(modelData.name) {
                                    case "Profile":
                                        // contentStack.push(profilePage);
                                        contentStack.push(profilePage, { userEmail: userEmail })

                                        break;
                                    case "Settings":
                                        contentStack.push(settingsPage);
                                        break;
                                    case "Messages":
                                        contentStack.push(messagesPage);
                                        break;
                                    case "Analytics":
                                        contentStack.push(analyticsPage);
                                        break;
                                }
                                console.log(modelData.name + " clicked")
                            }
                        }
                    }
                }
            }
        }
    }

    // Page Components
    Component {
        id: profilePage
        ProfilePage {}
    }

    Component {
        id: settingsPage
        SettingsPage {}
    }

    Component {
        id: messagesPage
        MessagesPage {}
    }

    Component {
        id: analyticsPage
        AnalyticsPage {}
    }
}
