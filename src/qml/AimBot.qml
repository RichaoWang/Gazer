import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import QtQuick.Layouts

MExpander {
    headerText: ("AimBot")
    expand: true
    implicitWidth: parent.width
    contentHeight: aim_sw.checked ? 300 : 60
    // visible:aim_sw.checked
    iconRes: "qrc:/image/aim.png"
    // is_debug: true
    Item {
        id: cont
        anchors.fill: parent
        Column {
            spacing: 5
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 20
                topMargin: 10
            }
            Row {
                spacing: -100

                Row {
                    spacing: 130
                    // 文字
                    Column {
                        spacing: 15
                        FluText {
                            text: ("开启AimBot")
                        }
                        FluText {
                            visible: aim_sw.checked
                            text: ("触发热键")
                        }
                        FluText {
                            visible: aim_sw.checked
                            text: ("愤怒模式")
                        }
                        FluText {
                            visible: aim_sw.checked
                            text: ("瞄准锁定")
                        }
                        FluText {
                            visible: aim_sw.checked
                            text: ("自动射击")
                        }
                        FluText {
                            visible: aim_sw.checked
                            text: ("绘制视场角")
                        }
                        FluText {
                            visible: aim_sw.checked && draw_fov_sw.checked && draw_fov_sw.visible
                            text: ("视场角大小")
                        }
                    }
                    // 开关
                    Column {
                        spacing: 12
                        FluToggleSwitch {
                            // 自瞄开关
                            id: aim_sw
                            onCheckedChanged: {
                                ExternalManager.setAimBot(checked)
                                console.log("开启AimBot状态:", ExternalManager.getAimBot())
                            }
                            Component.onCompleted: {
                                checked = ExternalManager.getAimBot()
                            }
                        }
                        MCombox {
                            // 热键
                            visible: aim_sw.checked
                            implicitHeight: 19
                            implicitWidth: 100
                            x: -60
                            currentIndex: ExternalManager.getAimBotHotKey()
                            model: ListModel {
                                id: model
                                ListElement {
                                    text: "左ALT键"
                                }
                                ListElement {
                                    text: "鼠标左按键"
                                }
                                ListElement {
                                    text: "鼠标右按键"
                                }
                                ListElement {
                                    text: "鼠标侧键1"
                                }
                                ListElement {
                                    text: "鼠标侧键2"
                                }
                                ListElement {
                                    text: "CAP键"
                                }
                                ListElement {
                                    text: "SHIFT键"
                                }
                                ListElement {
                                    text: "CONTROL键"
                                }
                            }
                            onCurrentIndexChanged: {
                                ExternalManager.setAimBotHotKey(currentIndex)
                                console.log("currentIndex: ", currentIndex)
                            }
                        }
                        FluToggleSwitch {
                            // 愤怒模式
                            id: ragebot_sw
                            visible: aim_sw.checked
                            checked: aim_sw.checked && ExternalManager.getRage()
                            onCheckedChanged: {
                                ExternalManager.setRage(checked)
                                console.log("愤怒模式:", ExternalManager.getRage())
                            }
                        }
                        FluToggleSwitch {
                            // 锁定瞄准
                            visible: aim_sw.checked
                            checked: aim_sw.checked && ExternalManager.getAimLock()
                            onCheckedChanged: {
                                ExternalManager.setAimLock(checked)
                                console.log("瞄准锁定:", ExternalManager.getAimLock())
                            }
                        }
                        FluToggleSwitch {
                            // 自动射击
                            visible: aim_sw.checked
                            checked: aim_sw.checked && ExternalManager.getAutoShot()
                            onCheckedChanged: {
                                ExternalManager.setAutoShot(checked)
                                console.log("自动射击:", ExternalManager.getAutoShot())
                            }
                        }
                        FluToggleSwitch {
                            // 绘制视场角
                            id: draw_fov_sw
                            visible: aim_sw.checked
                            checked: aim_sw.checked && ExternalManager.getDrawFov()
                            onCheckedChanged: {
                                ExternalManager.setDrawFov(checked)
                                console.log("绘制视场角:", ExternalManager.getDrawFov())
                            }
                        }
                        MSlider {
                            // 视场角大小
                            visible: aim_sw.checked && draw_fov_sw.checked && draw_fov_sw.visible
                            implicitWidth: 150
                            x: -100
                            topPadding: 0
                            stepSize:0.1
                            to: 24
                            onValueChanged: {
                                ExternalManager.setAimFov(value)
                                console.log("value: ", ExternalManager.getAimFov())
                            }
                            Component.onCompleted: {
                                value=ExternalManager.getAimFov()
                            }
                        }
                    }
                }
            }

            FluText {
                visible: aim_sw.checked
                text: ("打击部位")
            }
            Row {
                visible: aim_sw.checked
                spacing: 3
                FluRadioButton {
                    id: head_rb
                    text: "头部"
                    onClicked: {
                        if (checked) {
                            ExternalManager.addHitBox(6)
                        } else {
                            ExternalManager.removeHitBox(6)
                        }
                        console.log("hitbox idxs: ", ExternalManager.getHitBoxs())
                    }
                }
                FluRadioButton {
                    id: neak_rb
                    text: "脖子"
                    onClicked: {
                        if (checked) {
                            ExternalManager.addHitBox(5)
                        } else {
                            ExternalManager.removeHitBox(5)
                        }
                        console.log("hitbox idxs: ", ExternalManager.getHitBoxs())
                    }
                }
                FluRadioButton {
                    id: chest_rb
                    text: "胸部"
                    onClicked: {
                        if (checked) {
                            ExternalManager.addHitBox(4)
                        } else {
                            ExternalManager.removeHitBox(4)
                        }
                        console.log("hitbox idxs: ", ExternalManager.getHitBoxs())
                    }
                }
                FluRadioButton {
                    id: abdomen_rb
                    text: "腹部"
                    onClicked: {
                        if (checked) {
                            ExternalManager.addHitBox(2)
                        } else {
                            ExternalManager.removeHitBox(2)
                        }
                        console.log("hitbox idxs: ", ExternalManager.getHitBoxs())
                    }
                }
                FluRadioButton {
                    id: llimbs_rb
                    text: "下肢"
                    onClicked: {
                        if (checked) {
                            ExternalManager.addHitBox(0)
                        } else {
                            ExternalManager.removeHitBox(0)
                        }
                        console.log("hitbox idxs: ", ExternalManager.getHitBoxs())
                    }
                }
                Component.onCompleted: {
                    var hit_boxs = ExternalManager.getHitBoxs()
                    // console.log(hit_boxs)
                    // 历史原因 枚举的value比较乱 以下做一些说明 -.-
                    // 6-head neck-5  chest-4 abdomen-2 llimbs-0
                    for (let i = 0; i < hit_boxs.length; i++) {
                        if (hit_boxs[i] === 6) {
                            head_rb.checked = true
                        } else if (hit_boxs[i] === 5) {
                            neak_rb.checked = true
                        } else if (hit_boxs[i] === 4) {
                            chest_rb.checked = true
                        } else if (hit_boxs[i] === 2) {
                            abdomen_rb.checked = true
                        } else if (hit_boxs[i] === 0) {
                            llimbs_rb.checked = true
                        }
                    }
                }
            }
        }
    }
}