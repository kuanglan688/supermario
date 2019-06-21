import Felgo 3.0
import QtQuick 2.0
TiledEntityBase {
    id:bulletEntityBase

    entityType: "bullet"
    entityId: "mybullet"

    property alias bulletTime: imageTimer
    property alias bulletTime2: imageTimer2
    property alias bulletcollider: collider
    property alias image: image

    width: image.width*image.scale
    height: image.height*image.scale

    NumberAnimation {
        running: true
        target:image
        loops: Animation.Infinite
        from: 0
        to:360
        properties: "rotation"
        duration: 500
    }

    MultiResolutionImage{
        scale: 0.5
        id:image
        fillMode: Image.Stretch
        anchors.centerIn: parent
        source: "../../assets/img/game/magic.png"
    }

    BoxCollider{
        id:collider
        anchors.fill: image
        bodyType: Body.Dynamic

        collisionTestingOnlyMode: true
        categories: Box.Category14
        collidesWith: Box.Category3 | Box.Category8

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType==="opponent")
                otherEntity.die()
            else if(otherEntity.entityType==="ground")
                count=0
            else if  (otherEntity.entityType==="platform")
                count=10
        }
    }

    property int count: 0
    Timer{
        id: imageTimer
        running: false
        repeat: true
        interval: 100
        onTriggered: {
            count++

            if(gameScene.player.mirror)
                bulletEntityBase.x-=10
            else
                bulletEntityBase.x+=10

            if(count%20<10){
                bulletEntityBase.y-=10//上飞
            }else{
                bulletEntityBase.y+=10//下飞
            }

        }
    }

    Timer{
        id:imageTimer2
        running: false
        repeat: true
        interval: 4000
        onTriggered: {
            image.visible=false
            imageTimer.running=false
            console.log("imageTimer down down!!!")
        }
    }
}
/*
//    SpriteSequence{
//        id:image
//        height:74
//        width: 77
//        anchors.horizontalCenter: parent.horizontalCenter
//        interpolate: false
//        goalSprite: ""
////        scale: 0.5

//        Sprite{
//            id:sprite
//            name: "bullet"
//            source: "../../assets/img/game/store_icons.png"
//            frameCount: 1
//            frameX: 2*77
//            frameY: 0
//            frameHeight: 74
//            frameWidth: 77
//            frameDuration: 100
//        }
//    }
*/
