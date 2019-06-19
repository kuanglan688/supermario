import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id: diamond
    entityType: "diamond"
    width: diamondImage.width*diamondImage.scale
    height: diamondImage.height*diamondImage.scale

    MultiResolutionImage{
        id:diamondImage
        anchors.centerIn: parent
        scale: 0.8
        visible: !collected
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/PTModelSprite_ID31370.png"

    }

    BoxCollider{
        id:collider
        width: parent.width
        height: parent.width
        active: !collected
        anchors.centerIn: parent

        collisionTestingOnlyMode: true
        categories: Box.Category7
        collidesWith: Box.Category1
    }

    property bool collected: false
    function collect(){
        collected = true
    }
}