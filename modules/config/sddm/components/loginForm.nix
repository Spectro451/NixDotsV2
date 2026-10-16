''
  import QtQuick 2.11
  import QtQuick.Layouts 1.11
  import SddmComponents 2.0 as SDDM

  ColumnLayout {
      id: formContainer
      SDDM.TextConstants { id: textConstants }

      property int p: config.ScreenPadding
      property string a: config.FormPosition
      property alias systemButtonVisibility: systemButtons.visible
      property alias clockVisibility: clock.visible

      Clock {
          id: clock
          Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
          Layout.preferredHeight: root.height / 4
          Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
      }

      UserAvatar {
          id: userAvatar
          Layout.alignment: Qt.AlignHCenter
          Layout.preferredHeight: root.height / 8
          Layout.preferredWidth: Layout.preferredHeight * 2.2
          Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
          onUserSelected: function(name) {
              if (config.ForceLastUser == "true") input.currentUserName = name
          }
          Component.onCompleted: {
              if (config.ForceLastUser == "true") input.currentUserName = userAvatar.currentUser
          }
      }

      Input {
          id: input
          Layout.alignment: Qt.AlignVCenter
          Layout.preferredHeight: root.height / 10
          Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
      }

      SystemButtons {
          id: systemButtons
          Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
          Layout.preferredHeight: root.height / 4
          Layout.maximumHeight: root.height / 4
          Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
          exposedSession: input.exposeSession
      }

  }
''
