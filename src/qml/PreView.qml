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
            ctx.lineWidth = 2;
            if (p.isDrawHead) {
                ctx.strokeStyle = "#CDC1C5";
                ctx.beginPath();
                ctx.arc(160, 36, 34, 0, 2 * Math.PI);
                ctx.stroke();
            }

            if (p.isDrawBone) {
                ctx.strokeStyle = "#20B2AA";
                ctx.beginPath();
                ctx.moveTo(60, 2);
                ctx.lineTo(60, 92);
                ctx.moveTo(60, 2);
                ctx.lineTo(100, 2);

                ctx.moveTo(60, 415);
                ctx.lineTo(60, 325);
                ctx.moveTo(60, 415);
                ctx.lineTo(100, 415);

                ctx.moveTo(240, 2);
                ctx.lineTo(240, 92);
                ctx.moveTo(240, 2);
                ctx.lineTo(200, 2);

                ctx.moveTo(240, 415);
                ctx.lineTo(200, 415);
                ctx.moveTo(240, 415);
                ctx.lineTo(240, 325);

                ctx.stroke();
            }

            if (p.isDrawSkeleton) {
                ctx.strokeStyle = "#607081";
                ctx.beginPath();
                ctx.moveTo(160, 70);
                ctx.lineTo(160, 210);
                ctx.lineTo(140, 290);
                ctx.lineTo(160, 310);

                ctx.moveTo(160, 210);
                ctx.lineTo(180, 300);
                ctx.lineTo(190, 400);

                ctx.moveTo(160, 70);
                ctx.lineTo(130, 70);
                ctx.lineTo(110, 120);


                ctx.moveTo(160, 70);
                ctx.lineTo(200, 70);
                ctx.lineTo(215, 125);
                ctx.lineTo(185, 140);

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