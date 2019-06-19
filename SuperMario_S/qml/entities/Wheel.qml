import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{

    entityType: "opponent"
    variationType: "wheel"
    width: 80
    height: 120



    MultiResolutionImage{

        id:wheelImage
        width:parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit

        source: "../../assets/img/game/3691857a-90cb-11e9-adae-5452007b698aOri"

        NumberAnimation{
            running: true
            loops: Animation.Infinite
            target: wheelImage
            from: 0
            to:360
            property: "rotation"
            duration: 3000
        }
    }
}

