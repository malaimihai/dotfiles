import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../assets"

Item {
  property var user: "mm"
  property var password: passwordField.text
  property var session: sessionPanel.session
  property var inputHeight: Screen.height * 0.032
  property var inputWidth: Screen.width * 0.16
  Column {
    spacing: 8
    anchors {
      bottom: parent.bottom
      left: parent.left
    }
    PowerButton {
      id: powerButton
    }
    RebootButton {
      id: rebootButton
    }
    SleepButton {
      id: sleepButton
    }
    z: 5
  }
  Column {
    spacing: 8
    anchors {
      bottom: parent.bottom
      right: parent.right
    }
    SessionPanel {
      id: sessionPanel
    }
    z: 5
  }
  Column {
    spacing: 8
    z: 5
    width: inputWidth
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }
    PasswordField {
      id: passwordField
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter
      session: sessionPanel.session
    }
  }
}
