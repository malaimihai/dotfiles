import QtQuick 2.15
import SddmComponents 2.0

Item {
  id: clock
  width: parent.width
  property date now: new Date()

  Timer {
    interval: 1000; running: true; repeat: true
    onTriggered: clock.now = new Date()
  }

  Text {
    id: timeText
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top; anchors.topMargin: 530
    text: Qt.formatDateTime(clock.now, "HH:mm")
    font.pixelSize: 120
    font.family: config.Font
    color: "#CAD3F5"
  }

  Text {
    anchors.horizontalCenter: timeText.horizontalCenter
    anchors.top: timeText.bottom; anchors.topMargin: 8
    text: Qt.formatDateTime(clock.now, "dddd, dd MMMM yyyy")
    font.pixelSize: 27
    font.family: config.Font
    color: "#CAD3F5"
  }
}
