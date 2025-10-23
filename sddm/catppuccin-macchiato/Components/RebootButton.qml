import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  implicitHeight: rebootButton.height
  implicitWidth: rebootButton.width
  Button {
    id: rebootButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/reboot.svg")
      height: height - 25
      width: width - 25
      color: hovered ? "#24273a" : "#CAD3F5"
    }
    background: Rectangle {
      id: rebootButtonBackground
      radius: 15
      color: rebootButton.hovered ? "#c6a0f6" : "#24273a"
    }
    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      onClicked: sddm.reboot()
    }
    transitions: Transition {
      PropertyAnimation {
        properties: "color"
        duration: 300
      }
    }
  }
}
