import Felgo 3.0
import QtQuick 2.12

TiledEntityBase {

    id:magicBase
    entityType: "magic"
    width: magicImage.width
    height: magicImage.height

    signal visable();

    property alias magic: magicImage
    property alias collider: collider

    property bool check: false

    onVisable:{
            magicImage.visible=false
    }
    MultiResolutionImage{

        id:magicImage
        visible: true
        opacity: 0

        width: 64
        height: 64



        NumberAnimation {
            id:numberAnimation
            running: false
            target: magicImage
            property: "y"
            duration: 2010
            to:-54
            easing.type: Easing.InOutQuad

        }

        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/magic.png"
    }

    BoxCollider{
        id:collider
        anchors.fill: magicImage
        collisionTestingOnlyMode: true//这样就只有碰撞检测没有重力
        bodyType:Body.Dynamic
        categories: Box.Category16
        collidesWith: Box.Category1 | Box.Category2|Box.Category11
    }

    function showimage(){
        magicImage.opacity = 1
        numberAnimation.running=true
    }

}



