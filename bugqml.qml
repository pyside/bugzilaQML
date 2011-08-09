import Qt 4.7


Item {
    width: 1214
    height: 707

    Image {
        source: "green_board.jpg"
        fillMode: Image.TileVertically
        smooth: true
        anchors.fill: parent
        Row {
            spacing: 20
            Column {
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
                       model: bugmodel
                    }
                }
            }
            Column {
                Text {
                    font.family: "purisa"
                    font.pointSize: 28
                    font.underline: true
                    color: "white"
                    text: "<b>Results:</b><br>"
                }
                Text {
                    font.family: "purisa"
                    font.pointSize: 18
                    color: "orangered"
                    text: "<b>Unconfirmed Bugs:</b> " + bugmodel.unconfirmedBugs
                }
                Text {
                    font.family: "purisa"
                    font.pointSize: 18
                    color: "steelblue"
                    text: "<b>Openend Bugs:</b> " + bugmodel.openedBugs
                }
                Text {
                    font.family: "purisa"
                    font.pointSize: 18
                    color: "olivedrab"
                    text: "<b>Fixed Bugs:</b> " + bugmodel.fixedBugs
                }
            }
        }
    }
}

