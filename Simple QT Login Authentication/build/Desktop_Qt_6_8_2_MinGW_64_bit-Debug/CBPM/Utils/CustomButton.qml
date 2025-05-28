import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.impl
import QtQuick.Templates as T

Button {
    id: control

    property color backgroundColor: "#ff3951"

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font{
            pointSize: 12
            weight: Font.DemiBold
        }
        color: "#fff"
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        visible: !control.flat || control.down || control.checked || control.highlighted
        // color: control.pressed ? Qt.darker("#ff3951" , 1.08) : "#ff3951"
        color: control.pressed ? Qt.darker(control.backgroundColor, 1.08) : control.backgroundColor
        radius: 10
    }

}
