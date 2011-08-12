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

        source: "frame_top.jpg"
        smooth: true
    }

    BorderImage {
        id: frameCenter
        anchors.top: frameTop.bottom
        anchors.bottom: frameBottom.top
        anchors.left: parent.left
        anchors.right: parent.right
        border.left: 35
        border.right: 35

        source: "footer.jpg"
        //fillMode: Image.TileVertically
        smooth: true
        Repeater {
            id: bugSummaryList
            BugSummary {
                opacity: currentBug == index ? 1.0 : 0
                anchors.fill: parent
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 50
                anchors.rightMargin: 50

                bugID: BUG_ID
                bugSummary: BUG_SUMMARY
                bugStatus: BUG_STATUS
                bugComponent: BUG_COMPONENT
                bugAssigned: BUG_ASSIGNEE
                bugComments: BUG_COMMENTS

                Behavior on opacity {
                    NumberAnimation { duration: 1000 }
                }
            }
        }

        Timer {
            interval: 15000; running: true; repeat: true
            onTriggered: {
                currentBug++
                if (currentBug >= bugSummaryList.count)
                    currentBug = 0
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

        source: "frame_bottom.jpg"
        smooth: true
    }
}
