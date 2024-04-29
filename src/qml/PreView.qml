import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

Rectangle {
    id: p
    property bool isDrawHead: false
    property bool isDrawBone: false
    property bool isDrawSkeleton: false
    property bool isDrawHealth: false
    property bool isDis: false
    property bool isDraw: false
    property bool isDrawEye: false
    property bool isDrawName: false

    anchors.fill: parent
    color: Qt.rgba(0, 0, 0, 0)
    Image {
        id: viewImage
        anchors.fill: parent
        source: "qrc:/image/counter-strike-pp.png"
        fillMode: Image.PreserveAspectFit
    }

    Canvas {
        id: draw_canvas
        anchors.fill: viewImage // 与Image重叠
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height); // 清除画布

            if (!p.isDraw) {
                return
            }

            // 名字
            if (p.isDrawName) {
                ctx.fillStyle = "rgb(136,123,136)"; // 设置填充颜色
                ctx.font = "bold 20px Arial";
                ctx.fillText("玩家名字", 120, 18);
            }

            // 血条
            if (p.isDrawHealth) {
                ctx.fillStyle = "#52ef07";
                ctx.fillRect(60 - 9, 2, 4, 453);
            }

            // 距离
            if (p.isDis) {
                ctx.fillStyle = "rgb(253,127,2)"; // 设置填充颜色
                ctx.font = "bold 23px Arial";
                ctx.fillText("100m", 200, 200);
            }

            // 眼睛朝向
            if (p.isDrawEye) {
                ctx.strokeStyle = "#ea0d0d";
                ctx.beginPath();
                ctx.moveTo(150, 50);
                ctx.lineTo(70, 90);
                ctx.stroke();
            }

            ctx.lineWidth = 2;
            // 头
            if (p.isDrawHead) {
                ctx.strokeStyle = "#c58aa3";
                ctx.beginPath();
                ctx.arc(170 - 10, 36, 34, 0, 2 * Math.PI);
                ctx.stroke();
            }

            if (p.isDrawBone) {
                ctx.strokeStyle = "#20B2AA";
                ctx.beginPath();
                ctx.moveTo(60, 2);
                ctx.lineTo(60, 92);
                ctx.moveTo(60, 2);
                ctx.lineTo(100, 2);

                // ctx.moveTo(60, 415);
                ctx.moveTo(60, 455);
                ctx.lineTo(60, 365);
                ctx.moveTo(60, 455);
                ctx.lineTo(100, 455);

                ctx.moveTo(255, 2);
                ctx.lineTo(255, 92);
                ctx.moveTo(255, 2);
                ctx.lineTo(215, 2);

                ctx.moveTo(255, 455);
                ctx.lineTo(215, 455);
                ctx.moveTo(255, 455);
                ctx.lineTo(255, 365);

                ctx.stroke();
            }

            if (p.isDrawSkeleton) {
                ctx.strokeStyle = "#7cb2d9";
                ctx.beginPath();
                // left leg
                ctx.moveTo(160 + 15 - 10, 70 + 5);
                ctx.lineTo(165 - 10, 210 + 20);
                ctx.lineTo(140 + 15 - 10, 290 + 20);
                ctx.lineTo(160 + 15 - 10, 340);

                // right leg
                ctx.moveTo(165 - 10, 210 + 20);
                ctx.lineTo(185 - 10, 320);
                ctx.lineTo(200 - 10, 430);

                // left arm
                ctx.moveTo(160 + 15 - 10, 70 + 5);
                ctx.lineTo(130 + 15 - 10, 70);
                ctx.lineTo(110 + 10 - 10, 130);

                // right arm
                ctx.moveTo(160 + 15 - 10, 70 + 5);
                ctx.lineTo(200 + 30 - 10, 90);
                ctx.lineTo(215 + 25 - 10, 135);
                ctx.lineTo(185 - 10, 155);

                ctx.stroke();
            }

        }
    }

    Connections {
        target: espObj
        onDrawHeadSignal: {
            p.isDrawHead = f
            draw_canvas.requestPaint()
        }
        onDrawBoneSignal: {
            p.isDrawBone = f
            draw_canvas.requestPaint()
        }
        onDrawSkeletonSignal: {
            p.isDrawSkeleton = f
            draw_canvas.requestPaint()
        }
        onDrawHealthSignal: {
            p.isDrawHealth = f
            draw_canvas.requestPaint()
        }
        onDrawDisSignal: {
            p.isDis = f
            draw_canvas.requestPaint()
        }
        onDrawSignal: {
            p.isDraw = f
            draw_canvas.requestPaint()
        }
        onDrawEyeSignal: {
            p.isDrawEye = f
            draw_canvas.requestPaint()
        }
        onDrawNameSignal: {
            p.isDrawName = f
            draw_canvas.requestPaint()
        }
    }
}