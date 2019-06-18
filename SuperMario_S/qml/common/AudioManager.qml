import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0


//音频播放色设置
Item {
  id: audioManager

  Component.onCompleted: handleMusic()

  //menu music
  BackgroundMusic {
    id: mainMenuMusic

    autoPlay: false

    source: "../../assets/audio/menu/mainMenu.mp3"
  }

  BackgroundMusic {
    id: levelMenuMusic

    autoPlay: false

    source: "../../assets/audio/music/levelMunu.mp3"
  }


  // this function sets the music, depending on the current scene and the gameScene's state
  function handleMusic() {
//    if(activeScene === gameScene) {
//      if(gameScene.state == "play" || gameScene.state == "test")
//        audioManager.startMusic(playMusic)
//      else if(gameScene.state == "edit")
//        audioManager.startMusic(editMusic)
//    }
//    else {
      audioManager.startMusic(mainMenuMusic)
 //   }
  }


  //开始播放音乐
  function startMusic(music) {
    if(music.playing)
      return

    // otherwise stop all music tracks
    mainMenuMusic.stop()
    levelMenuMusic.stop()

    // play the music
    music.play()
  }

  // stop the sound effect with the given name
  function stopSound(sound) {
    if(sound === "playerInvincible")
      playerInvincible.stop()
    else
      console.debug("unknown sound name:", sound)
  }
}
