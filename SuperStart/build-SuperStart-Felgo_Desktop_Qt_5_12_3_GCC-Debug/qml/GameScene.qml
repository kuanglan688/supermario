import Felgo 3.0
import QtQuick 2.0
import "./gameElements"
import "./entities"
import "./common"
import "./levels"

// EMPTY SCENE

SceneBase{
    id:gameScene
    sceneAlignmentX: "left"
    sceneAlignmentY: "top"

    property int time: 300

    BackgroundImage{
        id:bgImage
        anchors.fill: parent
        property string picture1:"../assets/backgroundImage/bg1.png"
        source: picture1
    }

    Item {
        id: container
        transformOrigin: Item.TopLeft

        PhysicsWorld {
            id: physicsWorld

            property int gravityY: 0

            gravity: Qt.point(0, gravityY)

            debugDrawVisible: true
            z: 1000

//            running: true

            onPreSolve: {
                var entityA = contact.fixtureA.getBody().target
                var entityB = contact.fixtureB.getBody().target

                if(entityA.entityType === "platform" && (entityB.entityType === "player" || entityB.entityType === "opponent") && entityB.y + entityB.height > entityA.y + 1 // add +1 to avoid wrong border-line decisions
                        || (entityA.entityType === "player" || entityA.entityType === "opponent") && entityB.entityType === "platform" && entityA.y + entityA.height > entityB.y + 1) {

                    contact.enabled = false
                }

                if(entityA.entityType === "player" && entityB.entityType === "opponent"
                        || entityB.entityType === "player" && entityA.entityType === "opponent") {
                    contact.enabled = false
                }
            }
        }

    }

    Player{
        id:player
        x:20
        y:450
        z:1
    }

//  Level1{}

    Snail{
    id:snail
    x:680
    y:450
    z:1
    }

    MoveTouchButton{
        id:moveTouchButton
        controller: controller
    }

        JumpTouchButton{
        id:jumpTouchButton
        onPressed: {
        player.jump();
        }
        onReleased: {
        }
        }

    Keys.forwardTo: controller
    TwoAxisController{
        id:controller
        onInputActionPressed: {
            if(actionName == "up"){
                player.jump()
                player.state = "jumping"
            }
            else if(xAxis != 0){
                player.state = "walking"
            }else if(xAxis ==0){
                player.state = "standing"
            }

            console.debug("Key pressed actionName"+actionName)
        }

        onInputActionReleased: {
            if(actionName == "up"){

            }
        }
    }


    HUDShowAndText{
        id:scoreDisplay
        text: "Score:"
        result: "0"
    }

    HUDShowAndText{
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

    HUDShowAndText{
        id:coinsDisplay
        anchors.left: timeDisplay.right
        anchors.leftMargin: 15
        text: "Coins:"
        result: "100"

    }

    PlatformerImageButton{
        id:menuButton
        width: 80
        height: 60


        anchors.right:gameScene.gameWindowAnchorItem.right
        anchors.top: gameScene.gameWindowAnchorItem.top
        image.source: "../assets/img/game/home.png"
//        onClicked:
    }

}
