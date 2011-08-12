import QtQuick 1.0

Item {
    property alias timestamp: txtTime.text
    Image {
        source: "stamp.png"
        smooth: true
        Text {
            id: txtTime
            font.family: fontGiz.name
            font.pointSize: 18
            color: "white"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 30
            text: "08:32 PM"

        }
    }
}
