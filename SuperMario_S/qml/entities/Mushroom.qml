import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id: mushroom
    entityType: "powerup"
    width: image.width*image.scale
    height: image.height*image.scale

    //图片
    MultiResolutionImage{
        id:image
        scale: 1.5
        visible: !collected
        anchors.centerIn: parent
        source: "../../assets/img/game/mushroom.png"
    }

    //碰撞区域
    BoxCollider{
        id: collider
        width: parent.width
        height: parent.height
        active: !collected
        bodyType: Body.Dynamic
//        collisionTestingOnlyMode: true
        categories: Box.Category12
        collidesWith: Box.Category1|Box.Category8
    }

    property bool collected: false //是否被收集
    function collect(){
        collected = true
    }
}
