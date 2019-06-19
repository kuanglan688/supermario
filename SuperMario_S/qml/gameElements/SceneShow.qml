import QtQuick 2.0

Rectangle{
    width: textNmae.width + textResult.width+4
    height:30



    property alias text: textNmae.text
    property alias result: textResult.text
    anchors.top: gameScene.gameWindowAnchorItem.top
    anchors.left: gameScene.gameWindowAnchorItem.left
    anchors.margins: 4

    radius: 4
    opacity: 0.5
    color: "#ffffff"
    Text {
        id: textNmae
        font.family: "Palent"

        anchors.left: parent.left
        anchors.leftMargin: 2
        font.pixelSize: 20
    }

    Text {
        id: textResult
        font.family: "ParkAveD"

        verticalAlignment: Text.AlignVCenter

        anchors.left: textNmae.right
        anchors.leftMargin: 2
        font.pixelSize: 20
    }


}
