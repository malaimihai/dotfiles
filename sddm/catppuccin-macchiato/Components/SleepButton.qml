import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  implicitHeight: sleepButton.height
  implicitWidth: sleepButton.width
  Button {
    id: sleepButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/sleep.svg")
      height: height - 25
      width: width - 25
      color: hovered ? "#24273a" : "#CAD3F5"
    }
    background: Rectangle {
      id: sleepButtonBg
      color: sleepButton.hovered ? "#c6a0f6" : "#24273a"
      radius: 15
    }
    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      onClicked: sddm.suspend()
    }
    transitions: Transition {
      PropertyAnimation {
        properties: "color"
        duration: 300
      }
    }
  }
}
