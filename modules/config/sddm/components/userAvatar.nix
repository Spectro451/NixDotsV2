''
  import QtQuick 2.11
  import QtQuick.Controls 2.4
  import Qt5Compat.GraphicalEffects

  Item {
      id: avatarRoot

      property int currentIndex: userModel.lastIndex
      property int userCount: userModel.count
      readonly property int roleName: 257
      property string currentUser: userModel.data(userModel.index(currentIndex, 0), roleName) || ""

      signal userSelected(string name)

      function selectPrev() {
          if (userCount <= 1) return
          currentIndex = (currentIndex - 1 + userCount) % userCount
          userSelected(currentUser)
      }

      function selectNext() {
          if (userCount <= 1) return
          currentIndex = (currentIndex + 1) % userCount
          userSelected(currentUser)
      }

      Item {
          id: avatarWrapper
          anchors.centerIn: parent
          width: avatarRoot.height
          height: avatarRoot.height

          Rectangle {
              anchors.fill: parent
              radius: width / 2
              color: "transparent"
              border.color: root.palette.text
              border.width: 2
          }

          Image {
              id: avatarImage
              anchors.fill: parent
              anchors.margins: 4
              source: Qt.resolvedUrl("../Images/avatar.jpg")
              fillMode: Image.PreserveAspectCrop
              smooth: true
              mipmap: true
              visible: false
          }

          Rectangle {
              id: avatarMask
              anchors.fill: avatarImage
              radius: width / 2
              visible: false
          }

          OpacityMask {
              anchors.fill: avatarImage
              source: avatarImage
              maskSource: avatarMask
          }
      }

      Button {
          id: prevButton
          anchors.right: avatarWrapper.left
          anchors.verticalCenter: avatarWrapper.verticalCenter
          anchors.rightMargin: avatarRoot.height * 0.15
          width: avatarRoot.height * 0.35
          height: avatarRoot.height * 0.35
          visible: avatarRoot.userCount > 1
          hoverEnabled: true
          focusPolicy: Qt.NoFocus

          background: Rectangle { color: "transparent" }
          contentItem: Text {
              text: "‹"
              color: prevButton.hovered ? root.palette.highlight : root.palette.text
              font.pointSize: root.font.pointSize * 2.5
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
          }

          onClicked: avatarRoot.selectPrev()
      }

      Button {
          id: nextButton
          anchors.left: avatarWrapper.right
          anchors.verticalCenter: avatarWrapper.verticalCenter
          anchors.leftMargin: avatarRoot.height * 0.15
          width: avatarRoot.height * 0.35
          height: avatarRoot.height * 0.35
          visible: avatarRoot.userCount > 1
          hoverEnabled: true
          focusPolicy: Qt.NoFocus

          background: Rectangle { color: "transparent" }
          contentItem: Text {
              text: "›"
              color: nextButton.hovered ? root.palette.highlight : root.palette.text
              font.pointSize: root.font.pointSize * 2.5
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
          }

          onClicked: avatarRoot.selectNext()
      }
  }
''
