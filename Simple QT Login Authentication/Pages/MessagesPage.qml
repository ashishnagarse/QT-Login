import QtQuick
// import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

import CBPM

Page {
    id: messagesPage

    property var conversations: [
        {
            "name": "Alice Smith",
            "lastMessage": "Can you review the latest report?",
            "time": "10:30 AM",
            "unread": true
        },
        {
            "name": "Bob Johnson",
            "lastMessage": "Meeting scheduled for tomorrow",
            "time": "Yesterday",
            "unread": false
        },
        {
            "name": "Carol Williams",
            "lastMessage": "Project files updated",
            "time": "Yesterday",
            "unread": true
        },
        {
            "name": "David Brown",
            "lastMessage": "Thanks for your help!",
            "time": "2 days ago",
            "unread": false
        }
    ]

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 10

            CustomInput {
                Layout.fillWidth: true
                placeholderText: "Search messages..."
            }

            CustomButton {
                text: "New Message"
                highlighted: true
                backgroundColor: "#2196F3"
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: messagesPage.conversations
            clip: true
            delegate: ItemDelegate {
                width: parent.width
                height: 70

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 15

                    Rectangle {
                        width: 40
                        height: 40
                        radius: 20
                        color: "#DDDDDD"
                        
                        Label {
                            anchors.centerIn: parent
                            text: modelData.name[0]
                            font.bold: true
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 5

                        RowLayout {
                            Layout.fillWidth: true
                            
                            Label {
                                text: modelData.name
                                font.bold: modelData.unread
                            }
                            
                            Label {
                                text: modelData.time
                                color: "#666666"
                                Layout.alignment: Qt.AlignRight
                            }
                        }

                        Label {
                            text: modelData.lastMessage
                            color: "#666666"
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                    }

                    Rectangle {
                        visible: modelData.unread
                        width: 10
                        height: 10
                        radius: 5
                        color: "blue"
                    }
                }
            }
        }
    }
} 
