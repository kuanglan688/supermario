import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:tiledEntity

    x:row*gameScene.gridSize
    y:level.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize

}
