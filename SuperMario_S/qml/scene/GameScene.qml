import Felgo 3.0
import QtQuick 2.0

import "../gameElements"
import "../entities"
import "../common"
import "../levels"

SceneBase{

    id:gameScene
    gridSize: 32 //网格大小

    sceneAlignmentX: "left"
    sceneAlignmentY: "top"

    property alias player: player
    property alias bullet: bullet


    //背景图片
    BackgroundImage{
        id:bgImage
        anchors.fill: parent
        source: picture1
        property string picture1:"../../assets/img/game/PTModelSprite_ID35342.png"
    }

    property alias container: container
    //容器
    Item {
        id: container
        x:  (player.x>480?480-player.x:0)
        //关卡
//        Level1{
//            id:level1
//        }
        TestLevel{
            id: testlevel
        }

        //物理世界
        PhysicsWorld{
            id: physicalWorld
            debugDrawVisible:true// debugDrawVisible: false//这个是是否显示那个物理线，true显示，false不显示
            gravity: Qt.point(0,9)
            z:3
        }
        //玩家
        Player{
            id:player
            x:100
            y:450
            z:1
        }
        //玩家子弹
        Bullet{
            id: bullet
        }

    }

    //重置子弹位置
    function resetBullet(){
        bullet.visible = true
        bullet.collider.active = true
        var frontx = player.x>480?(480-player.width/2):player.x
        var backx = player.x>480?(480+player.width):player.x+player.width/2
        //bullet.x=player.mirror?frontx:backx
        bullet.x=player.x
        bullet.y=player.y+player.height*1/2
        bullet.bulletTime.running=true
        bullet.bulletTime2.start()
        bulletTimer.start()
        bulletAlive = true
        bullet.image.visible = true
        gameScene.mirror = player.mirror
    }
    property bool mirror: false

    //控制器
    Keys.forwardTo: controller
    TwoAxisController{
        id :controller
        onInputActionPressed: {
            if(actionName == "up"){ //跳跃
                player.jump()
            }else if(actionName == "fire"&&player.couldFire){ //开火
                if(!bulletAlive&&player.alive){ //子弹不存在且玩家活时
                    resetBullet()
                }
            }
        }
        onXAxisChanged: {
            player.changeDirection()
        }

    }

    property bool bulletAlive: false //控制子弹

    property alias bulletTimer: bulletTimer
    //子弹存在计时器
    Timer{
        id:bulletTimer
        repeat: false
        running: false
        interval: 4000
        onTriggered: {
            bulletAlive  = false
//            bullet.bulletTime2.stop()
            console.log("Wow! bullet dead")
        }
    }



    //在游戏中显示分数
    SceneShow{
        id:scoreDisplay
        text: "Score:"
        result: "0"
    }
    //在游戏中显示时间
    SceneShow{
        id:timeDisplay
        anchors.left: scoreDisplay.right
        anchors.leftMargin: 15
        text: "Time:"
        result: leftTime
    }
    //在游戏中显示金币
    SceneShow{
        id:coinsDisplay
        anchors.left: timeDisplay.right
        anchors.leftMargin: 15
        text: "Coins:"
        result: "100"

    }

    property int leftTime: 300 //游戏时间长度
    //游戏剩余时间计时器
    Timer{
        id:levelTimer
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            leftTime-=1
        }

    }

    //暂停页面
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
        image.source: "../../assets/img/game/home.png"
        mouseArea.onClicked: gameWindow.state = "menu"
//        mouseArea.onClicked: suspend.visible=true
    }

    //音乐控制
    MediaSound{
        id:mediaSound
    }

    //手机控制左右
    PhoneViewRL{
        id:phoneViewRL
        controller: controller
    }

    //手机控制跳跃
    PhoneViewUp{
        id:phoneViewUp
        onPressed: {
            player.jump();
        }
        onReleased: {
        }
    }

}
