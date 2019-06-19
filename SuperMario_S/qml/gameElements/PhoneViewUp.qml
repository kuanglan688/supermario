import Felgo 3.0
import QtQuick 2.0

Item {
    id: jumpTouchButton

    visible: !system.desktopPlatform
    enabled: visible

    height: 60
    width: 80

    anchors.right: gameScene.gameWindowAnchorItem.right
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom

    signal pressed  //定义的信号
    signal released

    Rectangle{
        id:upRectangle
        anchors.fill: parent

        radius: 0.4

        color: "#ffffff"
        opacity: 0.5

        visible: false

    }

    MultiResolutionImage{
        id:image
        source: "../../assets/img/game/up.png"
        anchors.fill: upRectangle
        fillMode: Image.PreserveAspectFit
        scale: 0.5
    }

    MouseArea{
    anchors.fill: parent

    onPressed: {
        jumpTouchButton.pressed()//发送信号
        upRectangle.visible=true
    }
    onReleased: {
        jumpTouchButton.released()
        upRectangle.visible=false
    }


    }
}
