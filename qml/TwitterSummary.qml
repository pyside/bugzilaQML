import QtQuick 1.0

Item {
    property string imgPhoto
    property string txtName
    property string txtTimestamp
    property string txtSource
    property string txtStatus

    anchors.fill: parent

    Row {
        spacing: 10
        id: rowTitle
        Image {
            id: photo
            source: imgPhoto
            smooth: true
            width: 64
            height: 64
        }
        Text {
            id: title
            font.family: fontGiz.name
            font.pointSize: 18
            color: "white"
            text: '<style type="text/css">a:link, a:visited {color:white;text-decoration:none}</style>'
                 +'<font color="steelblue"><b>@' + txtName + '</b></font><br>'
                 + txtTimestamp
                 + ' <font color="steelblue">via</font> ' + txtSource
        }
    }
    Text {
        id: message
        anchors.margins: 10
        anchors.top: rowTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.family: fontGiz.name
        font.pointSize: 18
        color: "white"
        text: '<style type="text/css">a:link, a:visited {color:white;text-decoration:none}</style>' + txtStatus
        wrapMode: Text.WordWrap
    }
}
