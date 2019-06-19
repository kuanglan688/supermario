import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../common"
Scene {
    id: mainMenuScene

    property variant mainMenuContentParticles
    // 关卡按钮信号
    signal levelScenePressed
    // 设置按钮信号
    signal optionScenePressed
    //排行榜按钮信号
    signal rankingScenePressed
    MainMenu{
       id:menuEditorWrapper

    }
    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        MultiResolutionImage {
            fillMode: Image.Stretch
            //1.Image.Stretch –图片自适应
            // 2.Image.PreserveAspectFit –图片均匀缩放,不需要裁剪
            //3.Image.PreserveAspectCrop –图片自动裁剪
            //4.Image.Tile –图片是水平和垂直方向复制的
            //5.Image.TileVertically –图片是水平方向复制的
            //6.Image.TileHorizontally –图片是垂直方向复制的
            //7.Iamge.Pad –图片不经过转换
            anchors.fill: parent
            source: "../../assets/img/ui/backgroud3.png"
        }
    }
    //OptionScene{x:1100;y:340; id:optionMenu;}

    // menu
    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "PLAY"
            onClicked: levelScenePressed()
        }

        MenuButton {

            text:  qsTr("Options")
            onClicked: { optionMenu.show()}
        }
        MenuButton {
            text: "Ranking"
            onClicked: rankingScenePressed()
        }
    }
    RowLayout{
        MultiResolutionImage {
            id: soundButton
            x: 20
            y: 10
            width: 108
            height: 109
            anchors.top: parent.top
            anchors.topMargin: -35
            source: settings.soundEnabled ? "../../assets/img/ui/sound_on.png" : "../../assets/img/ui/sound_off.png"
            scale: 0.2
            opacity: settings.soundEnabled ? 0.9 : 0.4

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // switch between enabled and disabled
                    if(settings.soundEnabled) {
                        settings.soundEnabled = false
                        audioManager.stopAudio("clickMusic")
                    }
                    else {
                        settings.soundEnabled = true
                        audioManager.playAudio("clickMusic")
                    }
                }
            }
        }

        MultiResolutionImage {
            id: musicButton
            x:10; y:10
            width: 108
            height: 109
            anchors.leftMargin: -33
            anchors.topMargin: -35

            source: "../../assets/img/ui/music.png"
            scale: 0.2
            opacity: settings.musicEnabled ? 0.9 : 0.4

            anchors.top: parent.top
            anchors.left: parent.left

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    // 背景音乐播放暂停的切换
                    if(settings.musicEnabled){
                        settings.musicEnabled = false
                        audioManager.stopAudio("mainMenuMusic")}
                    else
                        settings.musicEnabled = true
                    audioManager.playAudio("mainMenuMusic")
                }
            }
        }
    }


}

