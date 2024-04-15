import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

// todo 主要的用户交互UI

FluWindow {
    width: 760
    height: 540
    minimumWidth: 760
    minimumHeight: 540
    maximumWidth: 760
    maximumHeight: 540
    title: qsTr("Gazer")

    SidePart {
        id: side_part
        width: 200
        anchors.left: parent.left
        height: parent.height

    }

    MainPart {
        id: main_part
        anchors.left: side_part.right
        implicitHeight:parent.height
        width: parent.width - side_part.width
    }
}
