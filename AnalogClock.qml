import QtQuick 2.15
import QtQuick.Layouts 1.3
Rectangle
{
    id:equalWindowSizeRect
    property color clockBgColor: "White"
    property real hours:0
    property real minutes:0
    property real seconds:0
    border.color: "black"
    color:"transparent"

    Rectangle {
        id:clockRoot
        width: Math.min(equalWindowSizeRect.height,equalWindowSizeRect.width)
        height: width
        radius: width/2
        anchors.centerIn: parent
        color:equalWindowSizeRect.clockBgColor


        NumberRepeater{
            id:repeaterNumbers
            anchors.fill: parent
            allTimeNumbers: true
        }

        QtObject
        {
            id: props;
            property real handFactorGama: 0.4
        }
        ClockHand{
            id:second
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - second.height
            width: clockRoot.width*0.1
            height: clockRoot.height*0.4
            angleRotate: equalWindowSizeRect.seconds * 360 / 60;
        }
        ClockHand{
           MouseArea {
            id:minHand
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - minHand.height
            width: clockRoot.width*0.08
            height: clockRoot.height*0.4
            drag.target: parent
            drag.minimumY: -parent.height / 2 + height
            drag.maximumY: parent.height / 2
            onPositionChanged: {
                equalWindowSizeRect.minutes = (Math.atan2(y, x) + Math.PI / 2) * 180 / Math.PI;
                if (equalWindowSizeRect.minutes < 0) equalWindowSizeRect.minutes += 360;
                else if (equalWindowSizeRect.minutes >= 360) equalWindowSizeRect.minutes -= 360;
            }
           }

        }
        ClockHand{
           MouseArea {
            id:hourHand
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - hourHand.height
            width: minHand.width;
            height: minHand.height*props.handFactorGama;
            drag.target: parent
            drag.minimumY: -parent.height / 2 + height
            drag.maximumY: parent.height / 2
            onPositionChanged: {
                equalWindowSizeRect.hours = (Math.atan2(y, x) + Math.PI / 2) * 180 / Math.PI;
                if (equalWindowSizeRect.hours < 0) equalWindowSizeRect.hours += 360;
                else if (equalWindowSizeRect.hours >= 360) equalWindowSizeRect.hours -= 360;
            }
           }
        }
    }
}
