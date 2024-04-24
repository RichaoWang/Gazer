import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

Rectangle {
    id: p
    property bool isDrawHead: false
    property bool isDrawBone: false
    property bool isDrawSkeleton: false
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
            // // 血条
            // ctx.fillStyle = "#34880b";
            // ctx.fillRect(60-9, 2, 7, 453);

            // preview字样
            // ctx.fillStyle = "rgba(229,15,15,0.33)"; // 设置填充颜色
            // ctx.font = "bold 18px Arial";
            // ctx.fillText("Enemy", 60+70, 13);

            ctx.lineWidth = 2;
            if (p.isDrawHead) {
                ctx.strokeStyle = "#c58aa3";
                ctx.beginPath();
                ctx.arc(170-10, 36, 34, 0, 2 * Math.PI);
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
                ctx.moveTo(160+15-10, 70+5);
                ctx.lineTo(165-10, 210+20);
                ctx.lineTo(140+15-10, 290+20);
                ctx.lineTo(160+15-10, 340);

                // right leg
                ctx.moveTo(165-10, 210+20);
                ctx.lineTo(185-10, 320);
                ctx.lineTo(200-10, 430);

                // left arm
                ctx.moveTo(160+15-10, 70+5);
                ctx.lineTo(130+15-10, 70);
                ctx.lineTo(110+10-10, 130);

                // right arm
                ctx.moveTo(160+15-10, 70+5);
                ctx.lineTo(200+30-10, 90);
                ctx.lineTo(215+25-10, 135);
                ctx.lineTo(185-10, 155);

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
    }
}