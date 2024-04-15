import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

FluFrame {
    // property var is_water_mark: false   // 是否开启水印
    FluScrollablePage {
        anchors.fill: parent
        // 打上水印
        // FluWatermark {
        //     id: water_mark
        //     // visible: is_water_mark
        //     anchors.fill: parent
        //     text: "Gazer"
        //     textColor: Qt.rgba(0, 0, 0, 0.3)
        //     textSize: 30
        //     rotate: 30
        //     gap: Qt.point(50, 40)
        //     offset: Qt.point(10, 10)
        // }
        Column {
            anchors.fill: parent
            // todo ESP
            ESP {
            }
            // todo AimBot
            AimBot {
            }
            // todo RCS
            RCS {
            }
        }

    }
}


