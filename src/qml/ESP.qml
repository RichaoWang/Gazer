import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import QtQuick.Layouts

MExpander {
    signal drawHeadSignal(bool f)

    signal drawBoneSignal(bool f)

    signal drawSkeletonSignal(bool f)

    signal drawHealthSignal(bool f)

    signal drawDisSignal(bool f)

    signal drawSignal(bool f)

    signal drawEyeSignal(bool f)

    signal drawNameSignal(bool f)

    // id: espObj
    headerText: ("透视")
    expand: true
    implicitWidth: parent.width
    // contentHeight: 150
    contentHeight: esp_sw.checked ? 275 : 60
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
                        text: ("开启透视")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("包围框显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("头部显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("骨架显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("血条显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("距离显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("视野朝向显示")
                    }
                    FluText {
                        visible: esp_sw.checked
                        text: ("玩家名字显示")
                    }
                }
                // 开关
                Column {
                    spacing: 12
                    FluToggleSwitch {
                        id: esp_sw
                        x: checked ? -25 : 0
                        checked: ExternalManager.getESPenabled()
                        onCheckedChanged: {
                            ExternalManager.setESPenabled(checked)
                            drawSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawSignal(checked)
                            }
                        }
                    }

                    FluToggleSwitch {
                        id: bone_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowBoxESP()
                        onCheckedChanged: {
                            ExternalManager.setShowBoxESP(checked)
                            console.log("包围框状态:", ExternalManager.getShowBoxESP())
                            drawBoneSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawBoneSignal(checked)
                            }
                        }
                    }
                    FluToggleSwitch {
                        id: head_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowHeadBox()
                        onCheckedChanged: {
                            ExternalManager.setShowHeadBox(checked)
                            console.log("头部显示状态:", ExternalManager.getShowHeadBox())
                            drawHeadSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawHeadSignal(checked)
                            }
                        }
                    }
                    FluToggleSwitch {
                        id: ske_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowBoneESP()
                        onCheckedChanged: {
                            ExternalManager.setShowBoneESP(checked)
                            console.log("骨架显示状态:", ExternalManager.getShowBoneESP())
                            drawSkeletonSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawSkeletonSignal(checked)
                            }
                        }
                    }

                    FluToggleSwitch {
                        id: blood_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowHealthBar()
                        onCheckedChanged: {
                            ExternalManager.setShowHealthBar(checked)
                            drawHealthSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawHealthSignal(checked)
                            }
                        }
                    }

                    FluToggleSwitch {
                        id: dis_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowDistance()
                        onCheckedChanged: {
                            ExternalManager.setShowDistance(checked)
                            drawDisSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawDisSignal(checked)
                            }
                        }
                    }
                    FluToggleSwitch {
                        id: eye_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowEyeRay()
                        onCheckedChanged: {
                            ExternalManager.setShowEyeRay(checked)
                            drawEyeSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawEyeSignal(checked)
                            }
                        }
                    }
                    FluToggleSwitch {
                        id: name_sw
                        x: -25
                        visible: esp_sw.checked
                        checked: ExternalManager.getShowPlayerName()
                        onCheckedChanged: {
                            ExternalManager.setShowPlayerName(checked)
                            drawNameSignal(checked)
                        }
                        Component.onCompleted: {
                            if (checked) {
                                drawNameSignal(checked)
                            }
                        }
                    }
                }
            }
        }
    }
}