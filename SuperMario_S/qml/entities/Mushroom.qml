import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id: mushroom
    entityType: "powerup"
    width: image.width*image.scale
    height: image.height*image.scale

    MultiResolutionImage{
        id:image
        scale: 1.5
        visible: !collected
        anchors.centerIn: parent
        source: "../../assets/img/game/mushroom.png"
    }

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
