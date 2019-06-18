import Felgo 3.0
import QtQuick 2.0

Item {
//    visible: !system.desktopPlatform
//    enabled: visible

    height: 60
    width: 160// contain two Rectangle

    anchors.left:gameScene.gameWindowAnchorItem.left
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom

    property var controller

    Rectangle{
    id:leftRectangle
    width: parent.width/2
    height: parent.height
    anchors.left: parent.left

    opacity: 0.5
    color: "#ffffff"
    radius: 0.4

    visible: false

    }
    MultiResolutionImage{
    id:leftImage
    visible: true
    anchors.fill: leftRectangle
    source: "/root/SuperStart/SuperStart/assets/ui/left.png"
    fillMode: Image.PreserveAspectFit
    scale: 0.5

    }

    Rectangle{
    id:rightRectangle
    width: parent.width/2
    height: parent.height
    anchors.right: parent.right

    opacity: 0.5
    color: "#ffffff"
    radius: 0.4

    visible: false

    }
    MultiResolutionImage{
    id:rightImage
    anchors.fill: rightRectangle
    source: "/root/SuperStart/SuperStart/assets/ui/right.png"
    fillMode: Image.PreserveAspectFit
    scale: 0.5

    }
    MultiPointTouchArea{
        anchors.fill: parent
        onPressed: {
            if(touchPoints[0].x < width/2){
              controller.xAxis = -1
                leftRectangle.visible=true
            }
            else{
              controller.xAxis = 1
              rightRectangle.visible=true
            }
        }
        onUpdated: {
          if(touchPoints[0].x < width/2)
            controller.xAxis = -1
          else
            controller.xAxis = 1
        }

        onReleased: {
          // reset xAxis to zero
          controller.xAxis = 0

          // make backgrounds invisible again
           leftRectangle.visible = false
           rightRectangle.visible = false
        }
    }



}
