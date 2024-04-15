import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

MExpander {
    headerText: qsTr("ESP")
    expand: true
    implicitWidth: parent.width
    contentHeight: 130
    // is_debug: true
    Item {
        id: cont
        anchors.fill: parent
        Column {
            spacing: 10
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 20
                topMargin: 10
            }
            FluToggleSwitch {
                id: esp_tri_switch
                textSpacing: 40
                text: qsTr("开启ESP")
            }
            FluToggleSwitch {
                id: bone_tri_switch
                textSpacing: 40
                text: qsTr("包围框")
            }
            FluToggleSwitch {
                id: head_tri_switch
                textSpacing: 40
                text: qsTr("头部显示")
            }
            FluToggleSwitch {
                id: skeleton_tri_switch
                textSpacing: 40
                text: qsTr("骨架显示")
            }
        }
    }
}