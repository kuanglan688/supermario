import QtQuick 2.0

Rectangle {
    id: rectangle1
    color: "#a29d9d"

    property int score
    property int time

    Rectangle {
        id: rectangle
        x: 60
        width: 530
        height: 122
        color: parent.color
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: element
            anchors.centerIn: parent
            font.family: "Comic Sans MS"
            text: qsTr("Congratulations")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 45
        }
    }

        Text {
            id: element1
            x: 116
            y: 128
            width: 120
            height: 78
            font.family: "Comic Sans MS"
            text: qsTr("Score:")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 35
        }

        Text {
            id: score
            x: 354
            y:128
            width: 120
            height: 78
            font.pixelSize: 35
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text: qsTr("text")
            font.family: "Comic Sans MS"
        }

        Text {
            id: element2
            x: 116
            y: 223
            width: 120
            height: 78
            font.family: "Comic Sans MS"
            text: qsTr("Time:")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 35
        }
        Text {
            y:223
            width: 120
            height: 78
            font.pixelSize: 35
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            id: time
            x: 354
            text: qsTr("text")
            font.family: "Comic Sans MS"
        }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_height:64;anchors_width:339;anchors_x:115;anchors_y:41}
D{i:1;anchors_y:104}
}
 ##^##*/
