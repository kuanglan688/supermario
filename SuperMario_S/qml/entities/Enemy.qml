import Felgo 3.0
import QtQuick 2.0

EntityBase {
    entityType: "opponent"

    property int column
    property int row


    Component.onCompleted: console.log(startX)

    property bool alive: true

    x:(column-1)*gameScene.gridSize
    y:gameScene.gridSize*20 - row*gameScene.gridSize

    function die() {
        mediaSound.gameSound("enemy_killed")
        alive = false
        snailImage.opacity=0
    }



}
