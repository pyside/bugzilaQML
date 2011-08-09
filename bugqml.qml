import Qt 4.7


Item {
    width: 1214
    height: 975

    BorderImage {
        id: board
        anchors.top: parent.top
        anchors.left: parent.left
        border.right: 300

        source: "green_board.jpg"
        height: 707
        width: parent.width
        smooth: true
        Column {
            id: columnGraph
            Text {
                id: title
                anchors.horizontalCenter: graph.horizontalCenter
                font.family: "purisa"
                font.pointSize: 28
                color: "white"
                text: "<b>PySide</b> Bugzilla report"
            }

            Item {
                id: graph
                width: 800
                height: 600
                BarGraph {
                   dataModel: bugmodel
                }
            }
        }

        Column {
            width:280
            anchors.right: parent.right
            Text {
                font.family: "purisa"
                font.pointSize: 24
                font.underline: true
                color: "white"
                text: "<b>SUMMARY</b>"
            }
            Item {
                width: 2
                height: 30
            }
            Text {
                font.family: "purisa"
                font.pointSize: 16
                color: "orangered"
                text: "<b>Unconfirmed Bugs:</b> " + bugmodel.unconfirmedBugs
            }
            Text {
                font.family: "purisa"
                font.pointSize: 16
                color: "steelblue"
                text: "<b>Openend Bugs:</b> " + bugmodel.openedBugs
            }
            Text {
                font.family: "purisa"
                font.pointSize: 16
                color: "olivedrab"
                text: "<b>Fixed Bugs:</b> " + bugmodel.fixedBugs
            }
        }
    }

    Footer {
        anchors.top: board.bottom
        //anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: bugmodel
    }
}

