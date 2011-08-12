import QtQuick 1.0

Item {
    id: root
    property alias bugID: txtID.text
    property alias bugSummary: txtSummary.text
    property string bugStatus
    property string bugComponent
    property string bugAssigned
    property alias bugComments: txtComments.text

    Column {
        spacing: 15
        anchors.left: parent.left
        anchors.right: parent.right
        Item {
            width: parent.width
            height: imgID.height
            Image{
                id: imgID
                smooth: true
                source: "blur.jpg"

                Text {
                    id: txtID
                    anchors.centerIn: parent
                    text: "#951"
                    color: "#1c1c1c"
                    font.bold: true
                    font.pointSize: 18
                    font.family: fontGiz.name
                }
            }
            Text {
                id: txtSummary
                height: imgID.height
                elide: Text.ElideRight
                anchors.left: imgID.right
                anchors.leftMargin: 5
                anchors.right: parent.right

                verticalAlignment: Text.AlignVCenter
                color: "white"
                font.family: fontGiz.name

                font.pointSize: 18
            }
        }
        Row {
            spacing: 15
            Text {
                id: txtStatus
                color: "white"
                font.family: fontGiz.name
                font.pointSize: 14
                text: "<font color='steelblue'><b>Status: </b></font>" + bugStatus
            }
            Text {
                id: txtComponent
                color: "white"
                font.family: fontGiz.name
                font.pointSize: 14
                text: "<font color='steelblue'><b>Component: </b></font>" + bugComponent
            }
            Text {
                id: txtAssigned
                color: "white"
                font.family: fontGiz.name
                font.pointSize: 14
                text: "<font color='steelblue'><b>Assigned to: </b></font>" + bugAssigned
            }
        }
        Text {
            id: txtComments
            anchors.left: parent.left
            anchors.top: bugStatus.bottom
            color: "white"
            font.family: fontGiz.name
            font.pointSize: 14
            text: "Thanks for reporting this regression, we are going to fix it ASAP.<br>Regards"
        }
    }
}

