import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

// todo 主要的用户交互UI

FluWindow {
    width: 760
    height: 540
    minimumWidth: 760
    minimumHeight: 540
    maximumWidth: 760
    maximumHeight: 540
    showDark:true
    title: qsTr("Gazer")

    SidePart {
        id: side_part
        width: 200
        anchors.left: parent.left
        height: parent.height

    }

    MainPart {
        id: main_part
        anchors.left: side_part.right
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 22
    }

    // todo 绘制功能项
    Image {
        id: preview
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - 60
        source: "qrc:/image/counter-strike-pp.png"
        fillMode: Image.PreserveAspectFit
    }

    FluText {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 5
        }
        text: qsTr("Gazer© 2024 RichaoWang, All rights reserved.")
        color: FluTheme.fontSecondaryColor
    }
}
