import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0


FluRectangle {
    property var is_split_line_show: false

    color: Qt.rgba(0, 0, 0, 0)
    Rectangle {
        visible: parent.is_split_line_show
        width: 1
        color: Qt.rgba(0, 0, 0, 0.2)
        height: parent.height
        anchors.left: parent.right
    }

    // logo
    Column {
        anchors.top: parent.top
        anchors.topMargin: 10
        spacing: 10
        // csgo图标
        Image {
            width: 200
            source: "qrc:/image/csgo_icon.png"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        // X符号
        Image {
            width: 35
            source: "qrc:/image/x.png"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        // gazer font图标
        Rectangle {
            color: Qt.rgba(0, 0, 0, 0)
            border.color: "#838B8B"
            width: 170
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50
            radius: 15
            Image {
                anchors.fill: parent
                anchors.centerIn: parent
                source: "qrc:/image/gazer_font.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // 使用提示、版本号、其他信息等
    Row {
        id: version_number
        anchors {
            bottom: parent.bottom
            bottomMargin: 14
            horizontalCenter: parent.horizontalCenter
        }
        FluText {
            text: qsTr("Version: ")
            color: FluTheme.fontSecondaryColor
        }
        FluText {
            text: qsTr("test-0.0.1")  // todo 加一个自动更新版本号。。。
            color: FluTheme.fontSecondaryColor
        }
    }

    Row {
        id: tip_info
        anchors {
            bottom: about_lay.top
            bottomMargin: 14
            horizontalCenter: parent.horizontalCenter
        }
        FluText {
            text: qsTr("按 [INS] 键隐藏/显示界面")
        }
    }

    Row {
        id: about_lay
        anchors {
            bottom: version_number.top
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        Image {
            width: 35
            source: "qrc:/image/gazer_logo.png"
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
        }
        FluTextButton {
            text: qsTr("关于Gazer")
            font.pixelSize: 12
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                dialog.open()
            }
        }
    }

    // 关于Gazer dialog
    FluContentDialog {
        id: dialog
        title: qsTr("关于Gazer")
        message: qsTr("Gazer 是一个开源且免费的项目!")
        buttonFlags: FluContentDialogType.PositiveButton
        contentDelegate: Component {
            Item {
                implicitWidth: parent.width
                implicitHeight: 230
                Column {
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    // spacing: 5
                    Row {
                        FluCopyableText {
                            text: qsTr("GitHub:")
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        FluTextButton {
                            text: "https://github.com/RichaoWang/Gazer"
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                Qt.openUrlExternally(text)
                            }
                        }
                    }

                    FluCopyableText {
                        width: parent.width
                        wrapMode: Text.Wrap
                        font.bold: true
                        text: qsTr("该项目仅为个人学习逆向技术所需要，严禁进行联网性质的游戏对抗❌。\n* 本人承诺，实验中均以机器人为测试对象🦾。\n* 对此所产生的任何问题均与本人无关，由试用者自行承担所有责任🚧。")
                    }

                    FluCopyableText {
                        width: parent.width
                        wrapMode: Text.Wrap
                        font.bold: true
                        text: qsTr("Gazer由FluentUI框架为UI+CS2_External为Core打造，项目暂定遵循宽松的MIT协议，方便开发者二次开发。\nGazer将全面拥抱开源、反馈开源😀。")
                    }

                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 10
                        Image {
                            width: 70
                            source: "qrc:/image/gazer_logo.png"
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Image {
                            width: 180
                            source: "qrc:/image/gazer_font.png"
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
        positiveText: qsTr("我已悉知")
        onPositiveClicked: {
            close()
        }
    }
}
