import QtQuick 1.0

Item {
    property alias model: bugSummaryList.model
    property int currentBug : 0

    BorderImage {
        id: frameTop
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        border.left: 35
        border.right: 35

        source: "./images/frame_top.jpg"
        smooth: true
    }

    BorderImage {
        id: frameCenter
        anchors.top: frameTop.bottom
        anchors.bottom: frameBottom.top
        anchors.left: parent.left
        anchors.right: parent.right
        border.left: 40
        border.right: 40
        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat

        source: "./images/footer.jpg"
        //fillMode: Image.TileVertically
        smooth: true
        Repeater {
            id: bugSummaryList
            Item {
                opacity: currentBug == index ? 1.0 : 0
                anchors.fill: parent
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 50
                anchors.rightMargin: 50
                TwitterSummary {
                    imgPhoto: userImage
                    txtName: name
                    txtTimestamp: bugmodel.parseISODate(timestamp)
                    txtSource: source
                    txtStatus: statusText
                }

                /*
                BugSummary {
                    bugID: BUG_ID
                    bugSummary: BUG_SUMMARY
                    bugStatus: BUG_STATUS
                    bugComponent: BUG_COMPONENT
                    bugAssigned: BUG_ASSIGNEE
                    bugComments: BUG_COMMENTS
                }
                */

               Behavior on opacity {
                    NumberAnimation { duration: 1000 }
                }
            }
        }

        Timer {
            interval: 15000; running: true; repeat: true
            onTriggered: {
                currentBug++
                console.log("COUNT:"+bugSummaryList.count + " CURRENT: " + currentBug)
                if (currentBug >= bugSummaryList.count) {
                    if (bugSummaryList.status != XmlListModel.Loading) {
                        model.reload()
                    }
                    currentBug = 0
                }
            }
        }
    }

    BorderImage {
        id: frameBottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        border.left: 35
        border.right: 35

        source: "./images/frame_bottom.jpg"
        smooth: true
    }
}
