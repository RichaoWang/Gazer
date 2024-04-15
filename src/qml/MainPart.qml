import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0


FluScrollablePage {
    // todo ESP 感知


    // todo AimBot 自瞄

    // todo RCS 后坐力

    Column {
        anchors.centerIn: parent // 将按钮列居中显示
        spacing: 20
        Repeater {
            model: 20 // 重复30次创建按钮
            FluButton {
                text: "Button " + (index + 1) // 设置按钮文本
                width: 100
                height: 50
                onClicked: {
                    console.log("Button " + (index + 1) + " clicked") // 点击按钮时输出信息
                }
            }
        }
    }

}