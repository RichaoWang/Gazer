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
                        text: qsTr("俯仰角")
                    }
                    FluText {
                        visible: rcs_sw.checked
                        text: qsTr("偏航角")
                    }

                }

                Column {
                    spacing: 12
                    FluToggleSwitch {
                        id: rcs_sw
                        checked: true
                        // text: qsTr("开启ESP")
                    }

                    FluSlider {
                        visible: rcs_sw.checked
                        implicitWidth: 150
                        x: -100
                        topPadding: -2
                        to: 24
                    }

                    FluSlider {
                        visible: rcs_sw.checked
                        implicitWidth: 150
                        x: -100
                        topPadding: -2
                        to: 24
                    }
                }
            }
        }
    }
}