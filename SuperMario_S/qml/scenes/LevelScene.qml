import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.5

import "../common"

SceneBase {
    id: levelScene


    //信号
    signal levelScenenPressed()
    //返回主菜单信号
    signal backPressed()


    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
//        MultiResolutionImage {
//            fillMode: Image.Stretch
//            anchors.fill: parent
//            source: "../../assets/img/ui/playMune.png"
//        }
        color: "#ece468"
    }

    // back button to leave scene
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: levelScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: levelScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page{

            MultiResolutionImage {
                fillMode: Image.Stretch
                anchors.fill: parent
                source: "../../assets/img/ui/PTModelSprite_ID35380.png"
            }
        }
        Page{
            MultiResolutionImage {
                fillMode: Image.Stretch
                anchors.fill: parent
                source: "../../assets/img/ui/PTModelSprite_ID35359.png"
            }
        }
        Page {
            MultiResolutionImage {
                fillMode: Image.Stretch
                anchors.fill: parent
                source: "../../assets/img/ui/PTModelSprite_ID35353.png"
            }
        }
        Page {
//            Label {
//                text: qsTr("page four")
//                anchors.centerIn: parent
//                font.pixelSize: 30
//                font.italic: true
//                color:"yellow"
//            }
            MultiResolutionImage {
                fillMode: Image.Stretch
                anchors.fill: parent
                source: "../../assets/img/ui/PTModelSprite_ID35380.png"
            }

        }
    }


    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }


}


