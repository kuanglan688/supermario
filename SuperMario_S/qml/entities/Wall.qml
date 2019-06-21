import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    entityType: "wall"

    SpriteSequence{
        id:image
        width:64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false
        goalSprite: ""

        Sprite{
            name: "wall"
            source: "../../assets/img/game/destroyblock_new.png"
            frameCount: 1
            frameX: 0
            frameY: 0
            frameWidth: 64
            frameHeight: 64
            frameDuration: 100//每帧存在时间
        }
    }
}
