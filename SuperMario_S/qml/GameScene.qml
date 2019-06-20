import Felgo 3.0
import QtQuick 2.0
import "./gameElements"
import "./entities"
import "./common"
import "./levels"

// EMPTY SCENE

SceneBase{

    id:gameScene
    gridSize: 32
    sceneAlignmentX: "left"
    sceneAlignmentY: "top"

    focus: true
    property int time: 300
    property alias player: player

    BackgroundImage{
        id:bgImage
        anchors.fill: parent
        property string picture1:"../assets/img/game/PTModelSprite_ID35342.png"
        source: picture1
    }

    Item {
        id: container
        x:  (player.x>480?480-player.x:0)

        Level1{
            id:level1

        }
        PhysicsWorld{
            id: physicalWorld
            debugDrawVisible:true// debugDrawVisible: false//这个是是否显示那个物理线，true显示，false不显示
            gravity: Qt.point(0,9)
            z:3
        }
        Player{
            id:player
            x:100
            y:450
            z:1
        }
    }



    PhoneViewRL{
        id:phoneViewRL
        controller: controller
    }

    PhoneViewUp{
        id:phoneViewUp
        onPressed: {
            player.jump();
        }
        onReleased: {
        }
    }

    Keys.forwardTo: controller
    TwoAxisController{
        id :controller
        onXAxisChanged: {
            player.changeDirection()
        }

        onInputActionPressed: {
            //            console.log(actionName+" press " +xAxis+ " y:"+yAxis)
            if(actionName == "up"){
                player.jump()
            }else if(actionName == "fire"){
                if(!bulletalive&&player.alive){
                    entityId = entityManger.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Bullet.qml"), { entityId: "mybullet"})
                    bulletalive = true
                    var entity=entityManger.getEntityById(entityId)
                    var frontx = player.x>480?(player.x-player.width/2 -(player.x-480)):player.x
                    var backx = player.x>480?(player.x+player.width -(player.x-480)):player.x+player.width/2
                    entity.x=player.mirror?frontx:backx
//                    entity.image.x=player.mirror?frontx:backx
//                    entity.bulletcollider.x=player.mirror?frontx:backx
//                    entity.bulletcollider.x=entity.x
//                    entity.bulletcollider.y=entity.y

                    //                    var frontx = player.x>480?(player.x-player.width/2 -(player.x-480)):player.x-player.width/2
                    //                    var backx = player.x>480?(player.x+player.width/2 -(player.x-480)):player.x+player.width/2
                    //                    entity.x=player.mirror?frontx:backx

                    entity.y=player.y+player.height*1/2
//                    entity.image.y=player.y+player.height*1/2
                    entity.bulletTime.running=true
                    entity.bulletTime2.running=true
                    entity.visible=true
                    bulletTimer.start()
                    console.log(entity.x+"   "+entity.y)

                }
            }


        }
    }
    property bool bulletalive: false
    property var entityId
    Timer{
        id:bulletTimer
        repeat: false
        running: false
        interval: 4000
        onTriggered: {
            entityManger.removeEntityById(entityId)
            bulletalive  = false
        }
    }



    SceneShow{ //在游戏中显示分数和成绩
        id:scoreDisplay
        text: "Score:"
        result: "0"
    }
    SceneShow{
        id:timeDisplay
        anchors.left: scoreDisplay.right
        anchors.leftMargin: 15
        text: "Time:"
        result: time
    }

    Timer{
        id:levelTimer
        interval: 2000
        repeat: true
        running: true

        onTriggered: {
            time-=1
        }

    }
    SceneShow{
        id:coinsDisplay
        anchors.left: timeDisplay.right
        anchors.leftMargin: 15
        text: "Coins:"
        result: "100"

    }



    Suspend{
        id:suspend
        visible: false

    }

    PlatformerImageButton{
        id:menuButton
        width: 80
        height: 60


        anchors.right:gameScene.gameWindowAnchorItem.right
        anchors.top: gameScene.gameWindowAnchorItem.top
        image.source: "../assets/img/game/home.png"
        mouseArea.onClicked: suspend.visible=true
    }

    MediaSound{
        id:mediaSound
    }

    Bullet{
        id:bullet
        visible: false
    }

    //    Keys.onPressed: {
    //        if (event.key === Qt.Key_Space)
    //           {
    //            bullet.visible=true
    //            bullet.x=player.x+player.width
    //            bullet.y=player.y+player.height*1/2
    //            console.log("bullet")
    //        }
    //    }

}
