import QtQuick 2.0
import Felgo 3.0

Enemy{

    entityType: "opponent"
    variationType: "bear"
    id:bear


    width:  bearImage.width*bearImage.scale
    height: bearImage.height*bearImage.scale

    property int count: 0
    property bool bearState: true

    state: bearState == true ? "walking" : "die"

    MultiResolutionImage{
        id:bearImage
        scale: 0.5
        // transformOrigin: Item.Top //从图片底部中心缩放
        anchors.centerIn:  parent
        Behavior on opacity{
            NumberAnimation {duration: 20 }
        }
        property string bear1 :"../../assets/img/game/PTModelSprite_ID30184.png"
        property string bear2 :"../../assets/img/game/PTModelSprite_ID30185.png"
        property string bear3 :"../../assets/img/game/PTModelSprite_ID30186.png"
        property string bear4 :"../../assets/img/game/PTModelSprite_ID30187.png"
        property string bear5 :"../../assets/img/game/PTModelSprite_ID30188.png"
        property string bear6 :"../../assets/img/game/PTModelSprite_ID30189.png"
    }

    Timer{
        id: bearTimer
        interval: 400
        repeat: true
        running: true

        onTriggered: {
            if(bear.state == "walking"){
                switch(count % 6 ){
                case 0: bearImage.source = bearImage.bear1; break;
                case 1: bearImage.source = bearImage.bear2; break;
                case 2: bearImage.source = bearImage.bear3; break;
                case 3: bearImage.source = bearImage.bear4; break;
                case 4: bearImage.source = bearImage.bear5; break;
                case 5: bearImage.source = bearImage.bear6; break;
                }
                count++;

//                if(count%20<10){
//                    bear.x+=10;
//                    bearImage.mirror = true
//                }
//                else {
//                    bear.x-=10;
//                    bearImage.mirror = false
//                }
            }else if(bear.state == "die"){
                  bear.die();
            }
        }
    }

    PolygonCollider{
        id:collider
        active: true
        vertices:
            [
            Qt.point(10,1),
            Qt.point(50,11),
            Qt.point(50,34),
            Qt.point(56,80),
            Qt.point(31,80),
            Qt.point(3,67),
            Qt.point(3,50)
        ]
        bodyType: Body.Dynamic

        categories: Box.Category3
        collidesWith: Box.Category1 | Box.Category2
        friction: 0

        collisionTestingOnlyMode: true

    }

  function die()
  {
      bearImage.opacity = 0;
      collider.active =false;

  }

}

