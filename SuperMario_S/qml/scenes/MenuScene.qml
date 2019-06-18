import Felgo 3.0
import QtQuick 2.0
import "../common"


SceneBase {
    id: mainMenuScene

    // 关卡按钮信号
    signal levelScenePressed
    // 设置按钮信号
    signal optionScenePressed
    //排行榜按钮信号
    signal rankingScenePressed

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

    // menu
    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "PLAY"
            onClicked: levelScenePressed()
        }

        MenuButton {
            text: "Options"
            onClicked: optionScenePressed()
        }

        MenuButton {
            text: "Ranking"
            onClicked: rankingScenePressed()
        }
    }
    Row{
    MultiResolutionImage {
      id: soundButton
      width: 108
      height: 109
      // show sound_on or sound_off icon, depending on if sound is enabled or not
      source: settings.soundEnabled ? "../../assets/ui/sound_on.png" : "../../assets/ui/sound_off.png"
      // reduce opacity, if sound is disabled
      opacity: settings.soundEnabled ? 0.9 : 0.4

      anchors.top: musicButton.bottom
      anchors.topMargin: 10
      anchors.left: parent.left
      anchors.leftMargin: 30

      MouseArea {
          width: 108
          anchors.fill: parent

        onClicked: {
          // switch between enabled and disabled
          if(settings.soundEnabled) {
            settings.soundEnabled = false
          }
          else {
            settings.soundEnabled = true

            // play sound to signal, that sound is now on
            audioManager.playSound("playerJump")
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
                if(settings.musicEnabled)
                    settings.musicEnabled = false
                else
                    settings.musicEnabled = true
            }
        }
    }
    }
}
