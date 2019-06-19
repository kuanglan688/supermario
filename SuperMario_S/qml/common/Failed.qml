import QtQuick 2.0

Rectangle{
    Rectangle {
        id: rectangle
        x: 65
        y: 23
        width: 518
        height: 169
        color: "#ffffff"

        Text {
            id: element
            text: qsTr("LOSER")
            font.bold: true
            font.family: "Comic Sans MS"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 50
        }
    }

    Rectangle {
        id: rectangle1
        x: 70
        y: 247
        rotation: -30
        width: 275
        height: 145
        color: "#ffffff"

        Text {
            id: element1
            text: qsTr("Once  Again")
            font.family: "Comic Sans MS"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 45
        }
    }

    Rectangle {
        id: rectangle2
        x: 473
        y: 392
        width: 135
        height: 59
        color: "#ffffff"

        Text {
            id: element2
            text: qsTr("MENU")
            anchors.fill: parent
            font.bold: true
            font.family: "Comic Sans MS"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }
    }



}
