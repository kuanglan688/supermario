import QtQuick 2.0
import Felgo 3.0


TiledEntityBase{
    id:trampoline
    entityType: "trampoline"


    width: trampolineImage.width*trampoline.scale
    height: trampolineImage.height*trampoline.scale

    property alias trampolineImage : trampolineImage

    property alias trampoline1 : trampoline1
    property alias trampoline2 : trampoline2
    property alias trampoline3 : trampoline3

//    function push(){
//         trampoline1.to={"trampoline2":1};
//         trampoline2.to={"trampoline3":1};

//    }
//    function pob(){
//        trampoline3.to={"trampoline2":1};
//        trampoline2.to={"trampoline1":1};
//    }

    SpriteSequence{
        id:trampolineImage
        scale: 0.6
        running: true
        width: 64; height: 68
        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: true


        Sprite{
            id:trampoline1
            name:"trampoline1" ; source: "../../assets/img/game/trampoline.png"
            frameCount: 1;
            frameWidth: 64; frameHeight: 68;
            frameX:0; frameY: 136
            duration: 300
            to:{"trampoline2" : 1}

        }
        Sprite{
            id:trampoline2

            name:"trampoline2"; source: "../../assets/img/game/trampoline.png"
            frameCount: 1;
            frameWidth: 64; frameHeight: 68;
            frameX:0; frameY: 68
            duration: 300
             to:{"trampoline3" : 1}
        }
        Sprite{
            id:trampoline3

            name:"trampoline3"; source: "../../assets/img/game/trampoline.png"
            frameCount: 1;
            frameWidth: 64; frameHeight: 68;
            frameX:0; frameY: 0
            duration: 300
              to:{"trampoline1" : 1}
        }
    }

    BoxCollider{
        id:collider
        width: parent.width*0.6
        height: parent.height*0.6
        anchors.horizontalCenter: trampoline.horizontalCenter
        anchors.verticalCenter: trampoline.verticalCenter

        active: true
        bodyType: Body.Dynamic
        collisionTestingOnlyMode: false

        categories: Box.Category15
        collidesWith:  Box.Category2|Box.Category8


    }

}
