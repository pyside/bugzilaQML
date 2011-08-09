import QtQuick 1.0

Item {
    id: graph
    property variant dataModel
    anchors.fill: parent

    Item {
        id: data
        anchors.fill: parent
        anchors.margins: 20

        Row {
            id: canvas
            property int _maxValue : dataModel.maxValue
            anchors.fill: parent
            spacing: 10
            Item {
                width: 100
                height: 1
            }
            Bar {
               dataTitle: "P1"
               dataValue: dataModel.p1
               index: 0
            }
            Bar {
               dataTitle: "P2"
               dataValue: dataModel.p2
               index: 1
            }

            Bar {
               dataTitle: "P3"
               dataValue: dataModel.p3
               index: 2
            }

            Bar {
               dataTitle: "P4"
               dataValue: dataModel.p4
               index: 3
            }

            Bar {
               dataTitle: "P5"
               dataValue: dataModel.p5
               index: 4
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
