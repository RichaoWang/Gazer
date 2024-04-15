import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import QtQuick.Layouts

MExpander {
    headerText: qsTr("ESP")
    expand: true
    implicitWidth: parent.width
    contentHeight: 150
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
                        text: qsTr("包围框")
                    }
                    FluText {
                        text: qsTr("头部显示")
                    }
                    FluText {
                        text: qsTr("骨架显示")
                    }
                }
                // 开关
                Column {
                    spacing: 12
                    FluToggleSwitch {
                        // text: qsTr("开启ESP")
                    }
                    FluToggleSwitch {
                        // text: qsTr("包围框")
                    }
                    FluToggleSwitch {
                        // text: qsTr("头部显示")
                    }
                    FluToggleSwitch {
                        // text: qsTr("骨架显示")
                    }
                }
            }
            Image {
                width: 140
                height: 140
                source: "qrc:/image/skaman.png"
                // anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}