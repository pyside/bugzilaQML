import QtQuick 1.0

Column {
    property string dataTitle : 'bar'
    property int dataValue : 0
    property int index : 0

    anchors.bottom: parent.bottom

    Text {
        id: txtValue
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        font.family: fontGiz.name
        font.weight: Font.DemiBold

        color: Qt.hsla(0.1 * index, 1.0, 0.5, 1.0)
        text: dataValue
    }

    Rectangle {
        color: Qt.hsla(0.1 * index, 1.0, 0.5, 1.0)
        width: 100
        height: (((canvas.height - txtValue.height - txtSubtitle.height) * dataValue) / canvas._maxValue)
    }

    Text {
        id: txtSubtitle
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        font.family: fontGiz.name
        font.weight: Font.DemiBold
        color: "white"
        text: dataTitle
    }
}
