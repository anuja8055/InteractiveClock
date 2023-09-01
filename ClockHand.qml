import QtQuick 2.0
import QtQuick.Shapes 1.2

Shape {
    id:handRoot
    property real angleRotate: 0
    property color bgcolor: "Black"
    transform: Rotation {
        origin.x:handRoot.width/2 ;
        origin.y:handRoot.height;
        angle: handRoot.angleRotate
    }
    ShapePath {
        strokeWidth: 2
        strokeColor: "black"
        joinStyle:ShapePath.RoundJoin
        fillGradient: LinearGradient {
            x1: handRoot.width/2;    y1: 0
            x2: handRoot.width;      y2: handRoot.height/2
        }
        strokeStyle: ShapePath.DashLine
        dashPattern: [ 1, 2]
        startX: 0; startY: handRoot.height
        PathLine { x: handRoot.width/2; y: 0}
        PathLine { x: handRoot.width; y: handRoot.height}
        PathLine { x: 0; y: handRoot.height }
    }
}
