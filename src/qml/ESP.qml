import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import QtQuick.Layouts

MExpander {
    signal drawHeadSignal(bool f)

    signal drawBoneSignal(bool f)

    signal drawSkeletonSignal(bool f)

    // id: espObj
    headerText: qsTr("ESP")
    expand: true
    implicitWidth: parent.width
    // contentHeight: 150
    contentHeight: esp_sw.checked ? 150 : 60
    iconRes: "qrc:/image/vis.png"
    // is_debug: true
    Item {
        id: cont
        anchors.fill: parent
        Row {
            spacing: 60
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 20
                topMargin: 10
            }
            Row {
                spacing: 150
                // 文字
                Column {
                    spacing: 15
                    FluText {
                        text: qsTr("开启ESP")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: qsTr("包围框")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: qsTr("头部显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: qsTr("骨架显示")
                    }
                }
                // 开关
                Column {
                    spacing: 12
                    FluToggleSwitch {
                        id: esp_sw
                        checked: true
                        onClicked: {
                            console.log("开启ESP状态:", checked)
                            // if (!checked){
                            //     // drawHeadSignal(false)
                            //     // drawBoneSignal(false)
                            //     // drawSkeletonSignal(false)
                            // }
                        }
                    }
                    FluToggleSwitch {
                        visible: esp_sw.checked
                        onClicked: {
                            console.log("包围框状态:", checked)
                            drawBoneSignal(checked)
                        }
                    }
                    FluToggleSwitch {
                        visible: esp_sw.checked
                        onClicked: {
                            console.log("头部显示状态:", checked)
                            drawHeadSignal(checked)
                        }
                    }
                    FluToggleSwitch {
                        visible: esp_sw.checked
                        onClicked: {
                            console.log("骨架显示状态:", checked)
                            drawSkeletonSignal(checked)
                        }
                    }
                }
            }
        }
    }
}