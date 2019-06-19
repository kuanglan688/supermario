import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0


//音频播放设置
Item {
    id: audioManager

   // Component.onCompleted: handleMusic()

    //主菜单音乐
    BackgroundMusic {
        id: mainMenuMusic
        //autoPlay: false
        source: "../../assets/audio/menu/mainMenu.mp3"
    }
    BackgroundMusic{
        id:levelMenuMusic
         //autoPlay: false
        source: "../../assets/audio/menu/levelMenu.mp3"
    }
    SoundEffect{
        id:clickMusic
        source: "../../assets/audio/menu/mouseClick.wav"
    }

    function stopAudio(audio){
        audio.stop();
    }
    function playAudio(audio){
        if(audio === "mainMenuMusic")
            mainMenuMusic.play();
        if(audio === "clickMusic")
            clickMusic.play()
        if(audio === "levelMenuMusic")
            levelMenuMusic.play()
    }
    function startMusic(music){
            if(music.playing) {
                return
            } else{
                 mainMenuMusic.stop()
                 levelMenuMusic.stop()
                 music.play()
            }
    }
//    function handMusic(){
//      if(gameWindow.state === "menu" )
//          audioManager.startMusic("mainMenuMusic")
//      else if(gameWindow.state === "level")
//          audioManager.startMusic("levelMenuMusic")
//    }
}
