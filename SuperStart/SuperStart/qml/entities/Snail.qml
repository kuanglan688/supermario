import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{

    id:snail
    entityType: "opponent"
    variationType: "snail"

    width: 80
    height: 120

    property int speed: 70
    property int direction: -1

    property alias horizontalVelocity: colliderSensor.linearVelocity.x
    property alias verticalVelocity: colliderSensor.linearVelocity.y

    MultiResolutionImage{
        id:snailImage

        mirror: colliderSensor.linearVelocity.x <0 ?false : true //此属性保留图像是否应水平反转（有效地显示镜像图像）
         property string snailwalking_1: "../../assets/img/game/PTModelSprite_ID33374.png"
         property string snailwalking_2: "../../assets/img/game/PTModelSprite_ID33375.png"
         property string snailwalking_3: "../../assets/img/game/PTModelSprite_ID33376.png"
         property string snailwalking_4: "../../assets/img/game/PTModelSprite_ID33377.png"


    }
    property int snailstate: 0
    property  int snailWalkingCount: 0
    state: snailstate==0 ? "walking":"die"



    BoxCollider{
        id:colliderSensor
        width: snailImage.width
        height: snailImage.height

        anchors.horizontalCenter: parent.horizontalCenter

        bodyType: Body.Dynamic
         force: Qt.point(controller.xAxis*170*32,0)
//        categories: Box.Category4
//        collidesWith: Box.Category1 | Box.Category2 |Box.Category8

//        collisionTestingOnlyMode: true//加起之后将无法使用（原因：碰撞器仅用于碰撞检测，而不用于位置更新。）


        linearVelocity: Qt.point(direction*speed,0)

        onLinearVelocityChanged: {

            if(linearVelocity.x === 0 )
                direction *= -1
            linearVelocity.x = direction*speed
        }


    }

    Timer{
        id:snailTimer
        interval: 60
        repeat: true
        running: true
        onTriggered: {
            if(snail.state=="walking"){
                switch(snailWalkingCount%4){
                case 0:snailImage.source=snailImage.snailwalking_1;break;
                case 1:snailImage.source=snailImage.snailwalking_2;break;
                case 2:snailImage.source=snailImage.snailwalking_3;break;
                case 3:snailImage.source=snailImage.snailwalking_4;break;
                }
                snailWalkingCount++;
            }
            }

        }

    Timer{
        id:snailTimer2
        interval: 8000
        running: true
        repeat: true
        onTriggered: {
            colliderSensor.linearVelocity.x=0

        }
    }


    }



