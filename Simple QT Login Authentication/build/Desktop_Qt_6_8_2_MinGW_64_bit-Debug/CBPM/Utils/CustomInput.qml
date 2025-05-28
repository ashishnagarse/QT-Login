import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

TextField {
    id: control


    property string imageSource: ""

    implicitHeight: 40

    color: "#1e1e1e"
    font.pointSize: 12

    rightPadding: 44

    placeholderTextColor: "#999"

    background: Rectangle{
        anchors.fill: parent
        color: "#e1e1e1"
        radius: 10
    }

    Image {
        anchors{
            right: parent.right
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        width: 20
        height: 20
        source: control.imageSource
        fillMode: Image.PreserveAspectCrop
    }


}
