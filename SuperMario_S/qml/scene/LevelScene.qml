import Felgo 3.0
import QtQuick 2.12

// EMPTY SCENE

SceneBase {
    id: levelScene

    //背景
    Column {
        z: -1
        Repeater {
            id: repeater
            model: 10
            Rectangle {
                width: levelScene.width
                height: levelScene.height / 10
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: "lightblue"
                    }
                    GradientStop {
                        position: 0.5
                        color: "#CCCCCC"
                    }
                    GradientStop {
                        position: 1.0
                        color: "lightblue"
                    }
                }
            }
        }
    }

    //标题
    Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 20
        text: qsTr("select level")
        font.pointSize: 45
        font.family: "URW Chancery L"
    }

    //主菜单
    MultiResolutionImage{
        id: home
        width: parent.width/15
        height:parent.width/15
        source: "../../assets/img/game/home.png"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin:height/2
        anchors.rightMargin: width/2
        fillMode: Image.Stretch
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menu"
                console.log("back home")
            }
        }
    }

    //关卡
    Grid{

        id: levelgrid
        columns: 2
        //        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: title.bottom
        width: parent.width
        height: parent.height
        columnSpacing: parent.width/9
        leftPadding: parent.width/9
        rightPadding: parent.width/9
        rowSpacing: parent.height/10

        Rectangle{
            id: level1;
            width: parent.width/3;
            height: parent.height/3;
            radius: height/4
            color: "black"
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35579.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameWindow.state = "game"
                    gameScene.currentLevel = 0

//                    console.log("first level")
                }
            }
        }
        Rectangle{
            id: level2;
            width: parent.width/3;
            height: parent.height/3;
            color: "black"
            radius: height/4
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35621.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameScene.currentLevel = 1
                    gameWindow.state = "game"

//                    console.log("2 level")
                }
            }
        }

        Rectangle{
            id: level3;
            width:parent.width/3;
            height: parent.height/3;
            color: "black"
            radius: height/4
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35597.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameScene.currentLevel = 2
                    gameWindow.state = "game"

//                    console.log("3 level")
                }
            }
        }
        Rectangle{
            id: level4;
            width: parent.width/3;
            height: parent.height/3;
            color: "black"
            radius: height/4
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35609.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameScene.currentLevel = 3
                    gameWindow.state = "game"
//                    console.log("4 level")
                }
            }
        }
    }
}
