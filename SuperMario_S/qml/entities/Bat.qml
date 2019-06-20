import QtQuick 2.0
import Felgo 3.0

Enemy{

    entityType: "opponent"
    variationType: "bat"
    id:bat
    //state: "flying"

    width:  batImage.width*batImage.scale
    height: batImage.height*batImage.scale

    property int count: 0
    property bool batState: true

    state: batState == true ? "flying" : "die"

    MultiResolutionImage{
        id:batImage
        scale: 0.5
        // transformOrigin: Item.Top //从图片底部中心缩放
        anchors.centerIn:  parent
        Behavior on opacity{
            NumberAnimation {duration: 20 }
        }
        property string bat1 :"../../assets/img/game/PTModelSprite_ID32752.png"
        property string bat2 :"../../assets/img/game/PTModelSprite_ID32754.png"
        property string bat3 :"../../assets/img/game/PTModelSprite_ID32755.png"
        property string bat4 :"../../assets/img/game/PTModelSprite_ID32756.png"
        property string bat5 :"../../assets/img/game/PTModelSprite_ID32757.png"
    }

    Timer{
        id: batTimer
        interval: 400
        repeat: true
        running: true

        onTriggered: {
            if(bat.state == "flying"){
                switch(count % 5 ){
                case 0: batImage.source = batImage.bat1; break;
                case 1: batImage.source = batImage.bat2; break;
                case 2: batImage.source = batImage.bat3; break;
                case 3: batImage.source = batImage.bat4; break;
                case 4: batImage.source = batImage.bat5; break;
                }
                count++;

                if(count%20<10){
                    bat.x+=10;
                    batImage.mirror = true
                }
                else {
                    bat.x-=10;
                    batImage.mirror = false
                }
            }else if(bat.state == "die"){
                  bat.die();
            }
        }
    }


    PolygonCollider{
        id:collider
        active: true
//        anchors.fill: parent
//        anchors.centerIn: parent
        vertices:
            [
            Qt.point(10,1),
            Qt.point(74,11),
            Qt.point(80,34),
            Qt.point(56,60),
            Qt.point(31,60),
            Qt.point(3,67),
            Qt.point(3,50)
        ]

        //                 [
        //                    Qt.point(5,1),
        //                    Qt.point(132,29),
        //                    Qt.point(113,84),
        //                    Qt.point(120,130),
        //                    Qt.point(11,129),
        //                    Qt.point(4,100),
        //                    Qt.point(6,59)
        //                ]
        bodyType: Body.Dynamic

        categories: Box.Category5
        collidesWith: Box.Category1 | Box.Category2
        friction: 0

        collisionTestingOnlyMode: true

    }

  function die()
  {
      batImage.opacity = 0;
      collider.active =false;

  }

}

