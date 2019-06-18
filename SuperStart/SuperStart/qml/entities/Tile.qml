import QtQuick 2.0
import Felgo 3.0

Item {
    width:gameScene.gridSize
    height: gameScene.gridSize

    property alias image: sprite.source
    MultiResolutionImage{
    id:sprite
    }
}
