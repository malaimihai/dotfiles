import QtQuick 2.15
import QtQuick.Controls 2.15


Item {
  id: root
  width: 300
  height: 65

  // configure
  property string user: "mm"                   // your fixed username
  property int session: 0
  property string fontFamily: "CaskaydiaCove Nerd Font"
  property color baseBorder: "#7dc4e4"         // idle border
  property color capsBorder: "#f5a97f"         // caps_lock_enabled
  property color loadingBorder: "#a6da95"      // loading_checking
  property color failedBorder: "#ed8796"       // failed

  // state flags
  property bool capsOn: false
  property bool loading: false
  property bool failed: false

  // border color resolver (priority: failed > loading > caps > base)
  function borderColor() {
    if (failed) return failedBorder;
    if (loading) return loadingBorder;
    if (capsOn) return capsBorder;
    return baseBorder;
  }

  Rectangle {
    id: frame
    anchors.fill: parent
    radius: 122
    color: "#363a4f"
    border.width: 4
    border.color: root.borderColor()

    // Smooth border color transitions
    Behavior on border.color { ColorAnimation { duration: 500 } }

    // the actual password field, full-bleed inside the frame
    TextField {
      id: passwordField
      anchors.fill: parent
      anchors.margins: 0
      focus: true
      horizontalAlignment: TextInput.AlignHCenter
      verticalAlignment: TextInput.AlignVCenter

      echoMode: TextInput.Password
      passwordCharacter: "•"
      selectByMouse: true
      renderType: Text.NativeRendering
      color: "#CAD3F5"
      background: null

      font.family: root.fontFamily
      font.pixelSize: passwordField.text.length > 0 ? 28 : 20
      font.bold: true

      // No button: Enter submits
      onAccepted: {
        if (text.length === 0) return;
        root.failed = false;
        root.loading = true;
        sddm.login(root.user, text, root.session)
      }

      // Track caps lock toggles (best we can do in QML)
      Keys.onPressed: (ev) => {
        if (ev.key === Qt.Key_CapsLock) {
          root.capsOn = !root.capsOn;
          ev.accepted = true;
        }
      }
    }

    // Custom rich-text placeholder (since TextField placeholder can't style)
    Text {
      anchors.centerIn: parent
      visible: passwordField.text.length === 0 && !root.loading
      textFormat: Text.RichText
      color: "#cad3f5"
      font.family: config.Font
      font.pixelSize: 20
      text: "󰌾 <i> Password for </i><span style=\"color:#c6a0f6\"><b>"+ root.user +"</b></span>"
    }
  }



  // Hook SDDM failure to flip states
  Connections {
    target: sddm
    function onLoginFailed() {
      root.loading = false;
      root.failed = true;
      // clear the field and refocus
      frame.children[0].text = "";
      frame.children[0].forceActiveFocus();
    }
  }
}
