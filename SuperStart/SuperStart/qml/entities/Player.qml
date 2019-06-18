import Felgo 3.0
import QtQuick 2.0

EntityBase {

    id: player
    //    entityId: "entity"
    entityType: "player"
    width: 80
    height: 120


    property alias image: playerImage.source
    property real decelerationFactor: 0.6
    property alias horizontalVelocity: collider.linearVelocity.x
    property alias verticalVelocity: collider.linearVelocity.y

    MultiResolutionImage{
        id: playerImage

        property string playerstanding: "../../assets/img/game/PTModelSprite_ID34297.png"
        property string playerwalking_1: "../../assets/img/game/PTModelSprite_ID34261.png"
        property string playerwalking_2: "../../assets/img/game/PTModelSprite_ID34260.png"
        property string playerwalking_3: "../../assets/img/game/PTModelSprite_ID34259.png"
        property string playerwalking_4: "../../assets/img/game/PTModelSprite_ID34258.png"
        property string playerwalking_5: "../../assets/img/game/PTModelSprite_ID34257.png"
        property string playerwalking_6: "../../assets/img/game/PTModelSprite_ID34256.png"
        property string playerwalking_7: "../../assets/img/game/PTModelSprite_ID34255.png"
        property string playerwalking_8: "../../assets/img/game/PTModelSprite_ID34254.png"
        property string playerjumping: "../../assets/img/game/PTModelSprite_ID34277.png"
    }

    property int playerstate: 0
    property int playerWalkingCount: 0

    //0 standing;1 walking;2 jumping
    state: playerstate==0 ? "standing" : playerstate==1 ? "walking" : "jumping"

    BoxCollider{
        id: collider
        width: parent.width
        height: parent.height


//        collisionTestingOnlyMode: true
//        anchors.fill: playerImage
        anchors.horizontalCenter: parent.horizontalCenter
        bodyType: Body.Dynamic
        force: Qt.point(controller.xAxis*170*32,0)
//        fixture.onBeginContact:
//            playerImage.opacity = 0.1
        onLinearVelocityChanged: {
          if(linearVelocity.x > 170) linearVelocity.x = 170
          if(linearVelocity.x < -170) linearVelocity.x = -170
        }
    }

    Timer{
        id:playerTimer
        interval: 60
        repeat: true
        running: true
        onTriggered: {


            if(player.state=="standing"){
                playerImage.source = playerImage.playerstanding
            }else if(player.state=="jumping"){
                playerImage.source = playerImage.playerjumping
            }else if(player.state=="walking"){
                playerWalkingCount ++;
                switch(playerWalkingCount%8){
                case 0:playerImage.source = playerImage.playerwalking_1;break;
                case 1:playerImage.source = playerImage.playerwalking_2;break;
                case 2:playerImage.source = playerImage.playerwalking_3;break;
                case 3:playerImage.source = playerImage.playerwalking_4;break;
                case 4:playerImage.source = playerImage.playerwalking_5;break;
                case 5:playerImage.source = playerImage.playerwalking_6;break;
                case 6:playerImage.source = playerImage.playerwalking_7;break;
                case 7:playerImage.source = playerImage.playerwalking_8;break;
                }
            }

        }
    }

    function jump(){
        if(player.state!="jump"){
            collider.linearVelocity.y =-10
        }
    }


    Timer {
      id: updateTimer

      // Set this interval as high as possible to improve performance,
      // but as low as needed so it still looks good.
      interval: 60

      running: true
      repeat: true

      onTriggered: {
        var xAxis = controller.xAxis;

        // if xAxis is 0 (no movement command) we slow the player down
        // until he stops
        if(xAxis == 0) {
          if(Math.abs(player.horizontalVelocity) > 10)
            player.horizontalVelocity *= decelerationFactor
          else{
              player.state="standing"
            player.horizontalVelocity = 0
          }
        }
      }
    }

}

