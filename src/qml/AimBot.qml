import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

MExpander {
    headerText: qsTr("AimBot")
    expand: true
    implicitWidth: parent.width
    contentHeight: 260
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
                id: aimbot_tri_switch
                textSpacing: 40
                text: qsTr("开启AimBot")
            }
            FluToggleSwitch {
                id: fv_tri_switch
                textSpacing: 40
                text: qsTr("愤怒模式")
            }
            FluToggleSwitch {
                id: hotkrey_tri_switch
                textSpacing: 40
                text: qsTr("触发热键")
            }
            FluToggleSwitch {
                id: lock_tri_switch
                textSpacing: 40
                text: qsTr("瞄准锁定")
            }
            FluToggleSwitch {
                id: draw_fov_tri_switch1
                textSpacing: 40
                text: qsTr("绘制视场角")
            }
            FluToggleSwitch {
                id: autoshot_tri_switch1
                textSpacing: 40
                text: qsTr("自动射击")
            }
            FluToggleSwitch {
                id: fovsize_tri_switch1
                textSpacing: 40
                text: qsTr("视场角大小")
            }
            FluToggleSwitch {
                id: atk_tri_switch1
                textSpacing: 40
                text: qsTr("攻击部位")
            }
        }
    }
}