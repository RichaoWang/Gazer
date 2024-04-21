import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import QtQuick.Layouts

MExpander {
    headerText: qsTr("AimBot")
    expand: true
    implicitWidth: parent.width
    contentHeight: aim_sw.checked?260:60
    // visible:aim_sw.checked
    iconRes:"qrc:/image/aim.png"
    // is_debug: true
    Item {
        id: cont
        anchors.fill: parent
        Row {
            spacing: -100
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 20
                topMargin: 10
            }
            Row {
                spacing: 130
                // 文字
                Column {
                    spacing: 15
                    FluText {
                        text: qsTr("开启AimBot")
                    }
                    FluText {
                        visible:aim_sw.checked
                        text: qsTr("愤怒模式")
                    }
                    FluText {
                        visible:aim_sw.checked
                        text: qsTr("触发热键")
                    }
                    FluText {
                        visible:aim_sw.checked
                        text: qsTr("瞄准锁定")
                    }
                    FluText {
                        visible:aim_sw.checked
                        text: qsTr("绘制视场角")
                    }
                    FluText {
                        visible:aim_sw.checked
                        text: qsTr("自动射击")
                    }
                    FluText {
                        visible:aim_sw.checked
                        text: qsTr("视场角大小")
                    }
                }
                // 开关
                Column {
                    spacing: 12
                    FluToggleSwitch {
                        id:aim_sw
                        checked: true

                        // text: qsTr("开启ESP")
                    }
                    FluToggleSwitch {
                        visible:aim_sw.checked
                        // text: qsTr("包围框")
                    }
                    MCombox {
                        visible:aim_sw.checked
                        implicitHeight: 19
                        implicitWidth: 100
                        // font:
                        x: -60
                        model: ListModel {
                            id: model
                            ListElement {
                                text: "右鼠标按键"
                            }
                            ListElement {
                                text: "左鼠标按键"
                            }
                            ListElement {
                                text: "Coconut"
                            }
                        }
                    }
                    FluToggleSwitch {
                        visible:aim_sw.checked
                        // text: qsTr("骨架显示")
                    }
                    FluToggleSwitch {
                        visible:aim_sw.checked
                        // text: qsTr("包围框")
                    }
                    FluToggleSwitch {
                        visible:aim_sw.checked
                        // text: qsTr("头部显示")
                    }
                    FluSlider {
                        visible:aim_sw.checked
                        implicitWidth: 150
                        x: -100
                        topPadding: 0
                        to: 24
                    }
                }
            }
        }
    }
}