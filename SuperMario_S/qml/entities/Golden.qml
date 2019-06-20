import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    entityType: "golden"
    width: image.width
    height: image.height

//    signal sendSignal()
    property alias active: collider.active

    SpriteSequence{
        id:image
        width:64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false
        goalSprite: ""

        Sprite{
            id:start
            name: "start"
            source: "../../assets/img/game/bonusblock.png"
            frameCount: 5
            frameX: 0
            frameY: 0
            frameWidth: 64
            frameHeight: 64
            frameDuration: 100//每帧存在时间

//            to:{"block":1}
        }
        Sprite{
            id:block
            name: "block"
            source: "../../assets/img/game/bonusblock.png"
            frameCount: 1
            frameX: 320
            frameY: 0
            frameWidth: 64
            frameHeight: 64
            frameDuration: 100

        }
    }

    BoxCollider{
        width: parent.width
        height: parent.height
        id:collider
        active:true
        bodyType: Body.Static
        categories: Box.Category11

    }

    function show()
    {
        start.to={"block":1}
    }
}
