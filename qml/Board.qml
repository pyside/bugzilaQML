import Qt 4.7

import Charts 1.0
import QtQuick 1.0

Item {
    width: 1214
    height: 975

    FontLoader {
        id: fontGiz
        source: "./fonts/EraserRegular.ttf"
    }

    BorderImage {
        id: board
        border.left: 550
        border.right: 300

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: footer.top

        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat

        source: "./images/green_board.jpg"
        height: 707
        width: parent.width
        smooth: true

        Text {
            id: title
            anchors.left: parent.left
            anchors.right: summaryColumn.left

            font.family: fontGiz.name
            font.pointSize: 28
            color: "white"
            horizontalAlignment: Text.AlignHCenter

            text: "<b>PySide</b> Bugzilla report"
        }

        Item {
           id: graph
           anchors.left: parent.left
           anchors.top: title.bottom
           anchors.bottom: parent.bottom
           anchors.right: summaryColumn.left

           /*
           PieChart {
                anchors.centerIn: parent
                width: 600
                height: 600
                slices: [
                    PieSlice {
                        anchors.fill: parent
                        value: bugmodel.p1
                    },
                    PieSlice {
                        anchors.fill: parent
                        value: bugmodel.p2
                    },
                    PieSlice {
                        anchors.fill: parent
                        value: bugmodel.p3
                    },
                    PieSlice {
                        anchors.fill: parent
                        value: bugmodel.p4
                    },
                    PieSlice {
                        anchors.fill: parent
                        value: bugmodel.p5
                    }
                ]

            }
            */

            BarGraph {
               anchors.centerIn: parent
               width: 800
               height: 600

               dataModel: bugmodel
            }
        }

        Column {
            id: summaryColumn
            width:280
            spacing: 10
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
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

    RssModel {
        id: twitterModel
        phrase: "pyside"
    }

    Footer {
        id: footer
        height: 300
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: twitterModel.model
    }
}

