import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

MExpander {
    headerText: qsTr("RCS")
    expand: true
    implicitWidth: parent.width
    contentHeight: rcs_sw.checked ? 140 : 60
    iconRes: "qrc:/image/rcs.png"
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
                        text: qsTr("开启RCS")
                    }
                    FluText {
                        visible: rcs_sw.checked
                        text: qsTr("水平收敛度")
                    }
                    FluText {
                        visible: rcs_sw.checked
                        text: qsTr("垂直收敛度")
                    }

                }

                Column {
                    spacing: 12
                    FluToggleSwitch {
                        id: rcs_sw
                        onCheckedChanged: {
                            ExternalManager.setRCS(checked)
                            console.log("开启RCS状态:", ExternalManager.getRCS())
                        }
                        Component.onCompleted: {
                            checked = ExternalManager.getRCS()
                        }
                    }

                    MSlider {
                        // x scale
                        visible: rcs_sw.checked
                        implicitWidth: 150
                        x: -100
                        topPadding: -2
                        stepSize: 0.1
                        to: 2
                        onValueChanged: {
                            ExternalManager.setRCSScaleX(value)
                            console.log("x scale value: ", value)
                        }
                        Component.onCompleted: {
                            value=ExternalManager.getRCSScaleX()
                        }
                    }

                    MSlider {
                        // y scale
                        visible: rcs_sw.checked
                        implicitWidth: 150
                        x: -100
                        topPadding: -2
                        stepSize: 0.1
                        to: 2
                        onValueChanged: {
                            ExternalManager.setRCSScaleY(value)
                            console.log("y scale value: ", ExternalManager.getRCSScaleY())
                        }
                        Component.onCompleted: {
                            value=ExternalManager.getRCSScaleY()
                        }
                    }
                }
            }
        }
    }
}