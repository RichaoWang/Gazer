import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

MExpander {
    headerText: qsTr("RCS")
    expand: true
    implicitWidth: parent.width
    contentHeight: 100
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
                id: rcs_tri_switch
                textSpacing: 40
                text: qsTr("开启RCS")
            }
            FluToggleSwitch {
                id: yaw_tri_switch
                textSpacing: 40
                text: qsTr("俯仰角")
            }
            FluToggleSwitch {
                id: pitch_tri_switch
                textSpacing: 40
                text: qsTr("偏航角")
            }
        }
    }
}