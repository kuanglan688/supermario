import Felgo 3.0
import QtQuick 2.12

TiledEntityBase {
    id:magic
    entityType: "magic"
    width: magicImage.width*magicImage.scale
    height: magicImage.height*magicImage.scale

    //图片
    MultiResolutionImage{
        id:magicImage
        visible: visual
        width: 64
        height: 64
        scale: 0.8
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/magic.png"
    }

    //动画
    NumberAnimation {
        id:numberAnimation
        running: visual
        target: magic
        property: "y"
        duration: 2010
        to:magic.y - magic.height
        easing.type: Easing.InOutQuad
    }

    //碰撞区域
    BoxCollider{
        id:collider
        anchors.fill: parent
        active:!hasEated
        collisionTestingOnlyMode: true//这样就只有碰撞检测没有重力
        bodyType:Body.Dynamic
        categories: Box.Category16
        collidesWith: Box.Category1 | Box.Category2|Box.Category11
    }

    property bool visual: false
    property bool hasEated: false

    function beEated(){
        magicImage.visible=false
        visual = false
        hasEated = true
    }
}



