import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

FluFrame {
    FluScrollablePage {
        anchors.fill: parent
        // 打上水印
        FluWatermark {
            id: water_mark
            anchors.fill: parent
            text: "Gazer"
            textColor: Qt.rgba(0, 0, 0, 0.1)
            textSize: 20
            rotate: 30
            gap: Qt.point(20, 20)
            offset: Qt.point(10, 10)
        }

        Column {
            anchors.fill: parent
            ESP {
                id: espObj
            }
            AimBot {
                id: aimObj
            }
            // todo RCS
            RCS {
                id: rcsObj
            }
        }

    }

    // todo 绘制功能项
    PreView {
        id: pre_view
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 250+15
        anchors.verticalCenter: parent.verticalCenter
    }
}


