import QtQuick 1.0

Item {
    id: graph
    property alias model: listData.model
    anchors.fill: parent

    Item {
        id: data
        anchors.fill: parent
        anchors.margins: 20

        Row {
            id: canvas
            property int _maxValue : model.maxValue
            anchors.fill: parent
            spacing: 10
            Item {
                width: 100
                height: 1
            }
            Repeater {
                id: listData

                Bar {
                    dataTitle: title
                    dataValue: value
                }
            }
        }
    }

    // X
    Rectangle {
        color: "white"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 43
        height: 2
    }

    // Y
    Rectangle {
        color: "white"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: data.left
        width: 2
    }
}
