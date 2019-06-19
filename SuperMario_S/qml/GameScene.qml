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

    property int time: 300

    BackgroundImage{
        id:bgImage
        anchors.fill: parent
        property string picture1:"../assets/img/game/PTModelSprite_ID35342.png"
        source: picture1
    }
/*
//    Item {
//        id: container
//        transformOrigin: Item.TopLeft

//        PhysicsWorld {
//            id: physicsWorld

//            property int gravityY: 0

//            gravity: Qt.point(0, gravityY)

//            debugDrawVisible: false//这个是是否显示那个物理线，true显示，false不显示
//            z: 3

//            //            running: true

//            onPreSolve: {
//                var entityA = contact.fixtureA.getBody().target
//                var entityB = contact.fixtureB.getBody().target

//                if(entityA.entityType === "platform" && (entityB.entityType === "player" || entityB.entityType === "opponent") && entityB.y + entityB.height > entityA.y + 1 // add +1 to avoid wrong border-line decisions
//                        || (entityA.entityType === "player" || entityA.entityType === "opponent") && entityB.entityType === "platform" && entityA.y + entityA.height > entityB.y + 1) {

//                    contact.enabled = false
//                }

//                if(entityA.entityType === "player" && entityB.entityType === "opponent"
//                        || entityB.entityType === "player" && entityA.entityType === "opponent") {
//                    contact.enabled = false
//                }
//            }
//        }
*/

//        EntityManager{
//        id:entityManger
//        }

    Item {
         id: container
         x:  (player.x>480?480-player.x:0)

         Level1{
            id:level1

         }
         PhysicsWorld{
             id: physicalWorld
             debugDrawVisible:false// debugDrawVisible: false//这个是是否显示那个物理线，true显示，false不显示
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
                }else{
                    player.state = "walking"
                }
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

}
