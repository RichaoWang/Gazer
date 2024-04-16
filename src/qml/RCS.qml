import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

MExpander {
    headerText: qsTr("RCS")
    expand: true
    implicitWidth: parent.width
    contentHeight: 120
    iconRes:"qrc:/image/rcs.png"
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
                        text: qsTr("俯仰角")
                    }
                    FluText {
                        text: qsTr("偏航角")
                    }

                }

                Column {
                    spacing: 12
                    FluToggleSwitch {
                        // text: qsTr("开启ESP")
                    }

                    FluSlider {
                        implicitWidth: 150
                        x: -100
                        topPadding: -2
                        to: 24
                    }

                    FluSlider {
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