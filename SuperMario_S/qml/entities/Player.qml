import Felgo 3.0
import QtQuick 2.0

EntityBase {

    id: player
    entityType: "player"
    state:"standing"
    focus: true

    width: playerImage.width
    height: playerImage.height

//    property bool check: false
    property int count: 0
    signal send()

    MultiResolutionImage{
        id: playerImage
        scale: isbig?1:0.6 //缩放
        Behavior on scale {NumberAnimation{duration: 500}}
        Behavior on opacity {NumberAnimation{duration: 4000}} /*这里添加了动画*/
        //        mirror: (controller.xAxis==-1)
        transformOrigin: Item.Bottom //从图片底部中心缩放

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
    property bool isbig: false
    property alias mirror: playerImage.mirror


    PolygonCollider{
        id:collider
        vertices:isbig?
                     //big
                     [
                         Qt.point(0, 20),
                         Qt.point(30, 0),
                         Qt.point(60, 0),
                         Qt.point(77, 20),
                         Qt.point(77, 90),
                         Qt.point(60, 120),
                         Qt.point(0, 120),
                     ]
                     //small
                   :
                     [
                         Qt.point(33, 48),
                         Qt.point(52, 48),
                         Qt.point(62, 60),
                         Qt.point(62, 102),
                         Qt.point(52, 120),
                         Qt.point(15, 120),
                         Qt.point(15, 60),
                     ]

        force: Qt.point(controller.xAxis*accelerateForce,0)
        active: alive
        bodyType: Body.Dynamic //动态的物体之间才可以碰撞
        categories: Box.Category1
        collidesWith: Box.Category3|Box.Category7|Box.Category8|Box.Category11|Box.Category12|Box.Category11|Box.Category16|Box.Category9//与Box.Category3对手&&Box.Category8地板

        friction: 0  //摩擦力

        //设置最大速度
        onLinearVelocityChanged: {
            if(linearVelocity.x >maxspeed)linearVelocity.x = maxspeed
            else if(linearVelocity.x <-maxspeed)linearVelocity.x = -maxspeed
        }

        fixture.onBeginContact:{
            var otherEntiry = other.getBody().target
            console.log("here we contact")
            if(otherEntiry.entityType === "powerup"){
                mediaSound.gameSound("mushroom_catch")
                otherEntiry.collect()
                player.isbig = true

                couldjumptwotimes = true
                doublejump = true
                console.log("mushroom is collected")
            }else if(otherEntiry.entityType === "coin"){
                mediaSound.gameSound("coin")
                otherEntiry.collect()
                coinnumber ++
            }else if(otherEntiry.entityType === "diamond"){
                mediaSound.gameSound("diamond")
                otherEntiry.collect()
                diamondnumber ++
            }else if(otherEntiry.entityType === "home")/*人物在房子那里消失*/
            {
                mediaSound.gameSound("running_time")
                playerImage.opacity=0
                collider.active=false
            }else if(otherEntiry.entityType === "opponent"){
                player.die();
            }else if(otherEntiry.entityType ==="home")
            {
                mediaSound.gameSound("running_time")
                player.opacity=0
            }else if(otherEntiry.entityType === "magic"&&count==1)
            {

                mediaSound.gameSound("mushroom_catch")

                otherEntiry.visable();//分送信号
                console.log("collider")
            }else if(otherEntiry.entityType === "water")
                player.die();
            else if(otherEntiry.entityType === "spikerock")
                player.die();
        }

    }

    PolygonCollider{
        id:topCollider

        vertices: [
            Qt.point(29,0),
            Qt.point(19,7),
            Qt.point(19,10),
            Qt.point(40,10)
        ]
        active: alive
        bodyType: Body.Dynamic
        categories: Box.Category2
        collidesWith: Box.Category16|Box.Category11
        collisionTestingOnlyMode: true

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target

            if(otherEntity.entityType==="magic"){
                send()
//                otherEntity.check=true
                console.log("collider magic")
                mediaSound.gameSound("hit_block")
                otherEntity.showimage()
            }
            if(otherEntity.entityType==="golden")
            {
                console.log("collider golden")
                 otherEntity.show()
            }

        }

        friction: 0




    }

    Timer{
        id:checkTime
        running: false
        interval: 1000
        onTriggered: {
            count++
            console.log(count)
        }

    }


    onSend: {

        checkTime.running=true

    }
    property int coinnumber: 0 //金币数目
    property int diamondnumber: 0 //钻石数目
    property int accelerateForce: 200 //施加于player上的力
    property int maxspeed: 250 //最大速度


    BoxCollider{
        id: boxCollider
        width: 77*playerImage.scale-40
        height: 20*playerImage.scale

        //调试时显示传感器的位置
        Rectangle{
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            color: "red"
        }

        collisionTestingOnlyMode: true //设置只检测碰撞 不检测位置更新

        //显示传感器的位置
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        bodyType: Body.Dynamic
        active: collider.active
        categories: Box.Category2
        collidesWith: Box.Category3|Box.Category8|Box.Category11//11是金色的wall

        fixture.onBeginContact: {
            var otherEntiry = other.getBody().target
            //            console.log(otherEntiry.entityType+" at boxcllider area")
            if(otherEntiry.entityType === "ground"||otherEntiry.entityType === "platform"||otherEntiry.entityType === "golden"){
                enablejump = true
                if(couldjumptwotimes)
                    doublejump = true
                //                console.log("Now You Could Jump Two Times")
            } else if(otherEntiry.entityType === "opponent"){
                otherEntiry.die()
            }
        }
    }


    Timer{
        id:playerTimer
        interval: 60
        repeat: true
        running: true
        onTriggered: {

            //设置player的状态
            if(collider.linearVelocity.y===0){
                if(collider.linearVelocity.x===0){
                    player.state = "standing"
                }
                else
                    player.state = "walking"
            }
            else{
                player.state = "jumping"
            }

            //选择player的图片
            if(player.state == "standing"){
                playerImage.source = playerImage.playerstanding
            }else if(player.state == "jumping"){
                playerImage.source = playerImage.playerjumping
            }else if(player.state == "walking"){
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

            //玩家没有按左右键的情况
            var x =controller.xAxis;
            if(x == 0) {
                //速度大于10时 每次除以1.5 添加缓冲
                if(Math.abs(collider.linearVelocity.x) > 10) collider.linearVelocity.x /= 1.5
                else collider.linearVelocity.x = 0
            }
        }
    }
    property int playerWalkingCount: 0 //player walking 时的state

    //跳跃
    function jump(){

        mediaSound.gameSound("jump");
        //        console.log(player.state)
        if(player.state !== "jumping"&&enablejump){
            collider.linearVelocity.y = firstjumpspeed
            enablejump = false;
        }else if(doublejump){
            collider.linearVelocity.y = firstjumpspeed
            doublejump = false;
        }
    }
    property bool enablejump: true  //第一次跳跃
    property bool doublejump: false  //第二次跳跃
    property bool couldjumptwotimes: true //标记能否跳跃两次
    property int firstjumpspeed: -320  //第一次跳起速度
    property int secondjumpspeed: -250 //第二次跳起速度

    //改变 player 方向
    function changeDirection(){
        if(controller.xAxis == 1)
            playerImage.mirror = false
        if(controller.xAxis == -1)
            playerImage.mirror = true
    }

    property bool alive: true
    //人物死亡
    function die(){
        mediaSound.gameSound("gameover")
        jump()
        playerImage.opacity = 0
        collider.linearVelocity.x =0
        collider.force = Qt.point(0,0)
        deadTimer.start()
        console.log("player die")
    }
    //死亡计时器
    Timer{
        id :deadTimer
        running: false
        interval: 800
        repeat: false
        onTriggered: {
            alive = false
        }
    }



}
