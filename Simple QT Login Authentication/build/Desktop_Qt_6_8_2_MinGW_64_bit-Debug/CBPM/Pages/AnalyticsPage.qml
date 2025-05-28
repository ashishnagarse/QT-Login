import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: analyticsPage

    property var analyticsData: {
        "totalUsers": 1250,
        "activeUsers": 856,
        "dailyActive": 342,
        "monthlyGrowth": "+15%",
        "metrics": [
            { "month": "Jan", "value": 65 },
            { "month": "Feb", "value": 72 },
            { "month": "Mar", "value": 85 },
            { "month": "Apr", "value": 78 },
            { "month": "May", "value": 90 }
        ]
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Label {
            text: "Analytics Dashboard"
            font.pixelSize: 24
            font.bold: true
        }

        // Stats Grid
        GridLayout {
            Layout.fillWidth: true
            columns: 2
            columnSpacing: 20
            rowSpacing: 20

            // Total Users Card
            Rectangle {
                Layout.fillWidth: true
                height: 100
                color: "#f5f5f5"
                radius: 8

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15

                    Label {
                        text: "Total Users"
                        font.bold: true
                    }

                    Label {
                        text: analyticsPage.analyticsData.totalUsers
                        font.pixelSize: 24
                    }
                }
            }

            // Active Users Card
            Rectangle {
                Layout.fillWidth: true
                height: 100
                color: "#f5f5f5"
                radius: 8

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15

                    Label {
                        text: "Active Users"
                        font.bold: true
                    }

                    Label {
                        text: analyticsPage.analyticsData.activeUsers
                        font.pixelSize: 24
                    }
                }
            }

            // Daily Active Card
            Rectangle {
                Layout.fillWidth: true
                height: 100
                color: "#f5f5f5"
                radius: 8

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15

                    Label {
                        text: "Daily Active"
                        font.bold: true
                    }

                    Label {
                        text: analyticsPage.analyticsData.dailyActive
                        font.pixelSize: 24
                    }
                }
            }

            // Growth Card
            Rectangle {
                Layout.fillWidth: true
                height: 100
                color: "#f5f5f5"
                radius: 8

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15

                    Label {
                        text: "Monthly Growth"
                        font.bold: true
                    }

                    Label {
                        text: analyticsPage.analyticsData.monthlyGrowth
                        font.pixelSize: 24
                        color: "#4CAF50"
                    }
                }
            }
        }

        // Chart Area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#f5f5f5"
            radius: 8

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15

                Label {
                    text: "User Growth Trend"
                    font.bold: true
                }

                Row {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 2

                    Repeater {
                        model: analyticsPage.analyticsData.metrics

                        Rectangle {
                            width: 60
                            height: parent.height - 40
                            y: 20
                            color: "transparent"

                            Rectangle {
                                width: 40
                                anchors.bottom: parent.bottom
                                height: parent.height * (modelData.value / 100)
                                color: "#2196F3"
                                radius: 4
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Label {
                                text: modelData.month
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: -20
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }
        }
    }
} 
