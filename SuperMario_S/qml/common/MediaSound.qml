import QtQuick 2.0
import QtMultimedia 5.12

Item {
    id:mediaSound

    MediaPlayer{
        id:enemy_killed
        source: "../../assets/sound/enemy_killed.mp3"
    }

    MediaPlayer{
        id:diamond
        source: "../../assets/sound/diamond.mp3"
    }

    MediaPlayer{
        id:coin
        source: "../../assets/sound/coin.mp3"
    }

    MediaPlayer{
        id:mushroom_catch
        source: "../../assets/sound/mushroom_catch.mp3"
    }

    MediaPlayer{
        id:jump
        source: "../../assets/sound/jump.mp3"
    }

    MediaPlayer{
        id:gameover
        source: "../../assets/sound/gameover.mp3"
    }

    MediaPlayer{
        id:running_time
        source: "../../assets/sound/running_time.mp3"
    }

    MediaPlayer{
        id:shot
        source: "../../assets/sound/shot.mp3"
    }

    MediaPlayer{
        id:hit_block
        source: "../../assets/sound/hit_block.mp3"
    }

    MediaPlayer{
        id:kill_by_bullet
        source: "../../assets/sound/killed_by_bullet.mp3"
    }


    function gameSound(sound)//不同场景的声音函数
    {
        if(sound==="enemy_killed")
            enemy_killed.play();
        else if(sound==="diamond")
            diamond.play();
        else if(sound==="coin")
            coin.play();
        else if(sound==="mushroom_catch")
            mushroom_catch.play();
        else if(sound==="jump")
            jump.play();
        else if(sound==="gameover")
            gameover.play();
        else if(sound==="running_time")
            running_time.play();
        else if(sound==="shot")
            shot.play();
        else if(sound==="hit_block")
            hit_block.play();
        else if(sound==="kill_by_ballet")
            kill_by_bullet.play();

    }

}
