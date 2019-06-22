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

    property int currentLevel: 1

    //背景图片两张
    MultiResolutionImage{
        id:bgimage1
        source: selectLevel()
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        //        y:height
        x:-480
        //        x:0
        visible: true
        // width>x >-width
    }
    MultiResolutionImage{
        id:bgimage2
        source: selectLevel()
        width: parent.width
        height: parent.height
        //        y:height
        anchors.verticalCenter: parent.verticalCenter
        x:bgimage1.x+width
        //        visible: false
        // width>x >-width
        Component.onCompleted: {
            selectLevel()
        }
    }
    //    Timer{
    //        running: true
    //        repeat: true
    //        interval: 50
    //        onTriggered: {
    //            bgimage1.x = container.x %960
    //            bgimage2.x = bgimage1.x+bgimage1.width
    //        }
    //    }

    property string bg0:"../../assets/img/game/PTModelSprite_ID35342.png"
    property string bg1:"../../assets/img/game/PTModelSprite_ID35380.png"
    property string bg2:"../../assets/img/game/PTModelSprite_ID35353.png"
    property string bg3:"../../assets/img/game/PTModelSprite_ID35359.png"
    function selectLevel(){
        switch(currentLevel){
        case 0: return bg0;
        case 1: return bg1;
        case 2: return bg2;
        case 3: return bg3;
        }
    }

    property alias container: container
    //容器
    Item {
        id: container
        x:  (player.x>480?480-player.x:0)
        y:  player.y<200?200-player.y:0

        property alias loader: loader

        //        物理世界
        PhysicsWorld{
            id: physicalWorld
            debugDrawVisible:false// debugDrawVisible: false//这个是是否显示那个物理线，true显示，false不显示
            gravity: Qt.point(0,9)
            z:3
        }

        //        玩家
        Player{
            id:player
            x:100
            y:100
            z:1
        }
        //        玩家子弹
        Bullet{
            id: bullet
        }

        //关卡变成动态加载 在选择关卡时动态加载
        Loader{
            id:loader
        }

        EntityManager{
            entityContainer:  container
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
