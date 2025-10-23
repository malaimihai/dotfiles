import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  implicitHeight: powerButton.height
  implicitWidth: powerButton.width
  Button {
    id: powerButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/power.svg")
      height: height - 25
      width: width - 25
      color: hovered ? "#24273a" : "#CAD3F5"
    }
    background: Rectangle {
      id: powerButtonBackground
      radius: 15
      color: powerButton.hovered ? "#c6a0f6" : "#24273a"
    }
    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      onClicked: sddm.powerOff()
    }
    transitions: Transition {
      PropertyAnimation {
        properties: "color"
        duration: 300
      }
    }
  }
}
