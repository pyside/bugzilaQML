import Qt 4.7


Item {
    width: 1214
    height: 975

    FontLoader {
        id: fontGiz
        source: "./fonts/EraserRegular.ttf"
    }

    BorderImage {
        id: board
        anchors.top: parent.top
        anchors.left: parent.left
        border.right: 300

        source: "./images/green_board.jpg"
        height: 707
        width: parent.width
        smooth: true
        Column {
            id: columnGraph
            Text {
                id: title
                anchors.horizontalCenter: graph.horizontalCenter
                font.family: fontGiz.name
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
            id: summaryColumn
            width:280
            spacing: 10
            anchors.right: parent.right
            Text {
                font.family: fontGiz.name
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
                font.family: fontGiz.name
                font.pointSize: 14
                color: "steelblue"
                text: "<b>Open Bugs:</b> " + bugmodel.openedBugs
            }
            Text {
                font.family: fontGiz.name
                font.pointSize: 14
                color: "orangered"
                text: "<b>Unconfirmed Bugs:</b> " + bugmodel.unconfirmedBugs
            }
            Text {
                font.family: fontGiz.name
                font.pointSize: 14
                color: "olivedrab"
                text: "<b>Fixed Bugs:</b> " + bugmodel.fixedBugs
            }
       }

       Stamp {
           width: 250
           height: 250
           rotation: -30
           anchors.right: summaryColumn.right
           anchors.bottom: parent.bottom
           timestamp: bugmodel.lastUpdate
       }

    }

    Footer {
        id: footer
        anchors.top: board.bottom
        //anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: bugmodel
    }
}

