import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

// todo 主要的用户交互UI

FluWindow {
    width: 760
    height: 540
    // minimumWidth: 760
    // minimumHeight: 540
    // maximumWidth: 760
    // maximumHeight: 540
    fixSize:true  // 不要通过设置min max来固定大小，提供了fixSize属性来设置
    showDark: true
    title: "Gazer"

    // 侧边
    SidePart {
        id: side_part
        width: 200
        anchors.left: parent.left
        height: parent.height

    }

    // 主页
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

    // 底部
    FluText {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 5
        }
        text: "Gazer© 2024 RichaoWang, All rights reserved."
        color: FluTheme.fontSecondaryColor
    }

    Component.onCompleted: {
        var msg = ExternalManager.init()
        if (msg !== "") {
            error_dialog.error_msg = msg
            error_dialog.open()
        } else {
            showSuccess("核心注入成功，enjoy~😇",3000)
        }
    }

    FluContentDialog {
        property string error_msg: ""
        id: error_dialog
        title: "启动Gazer失败"
        message: error_msg
        buttonFlags: FluContentDialogType.PositiveButton
        positiveText: "退出"
        onPositiveClicked: {
            Qt.quit()
        }
    }
}
