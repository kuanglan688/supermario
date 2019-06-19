import Felgo 3.0
import QtQuick 2.0
import "../common"


SceneBase{
    id:rinkingScene


    Rectangle{
        anchors.fill: parent.gameWindowAnchorItem
        color: "pink"
    }
    Text {
        y: 64
        anchors.horizontalCenter: parent.horizontalCenter
        text: "RANKING  LIST"
        anchors.horizontalCenterOffset: 0
    }
    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 100

        id:head
        y: 100
        width: 332
        height: 43
        anchors.horizontalCenterOffset: 0
        spacing: 80
        Rectangle{
            id:name
            width: 60; height: 30
            Text {
                width: 44
                height: 18
                anchors.centerIn: parent
                text: "name"
            }
        }
        Rectangle{
            id:score
            width: 60; height: 30
            Image {
                anchors.centerIn: parent
                scale: 0.4
                source: "/run/media/root/linux_data/SuperMario_S/assets/img/ui/PTModelSprite_ID31370.png"
            }
        }
        Rectangle{
            id:timer
            width: 60; height: 30
            Text {
                anchors.centerIn: parent
                text: "4`59"
            }
        }

    }
    ListView{
        id:rinking
        x: 48
        y: 185
        width: 545; height: 132
        model:model
       // delegate: delegate
        snapMode: ListView.SnapToItem
        orientation: ListView.verticalLayoutDirection
        clip: true
        focus: true; keyNavigationWraps: true

        header:Row{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 100

            //id:head
            y: 62
            width: 280
            height: 46
            anchors.horizontalCenterOffset: 0
            spacing: 80
            Rectangle{
                //id:name
                width: 60; height: 30
                Text {
                    anchors.centerIn: parent
                    text: "name"
                }
            }
            Rectangle{
              //  id:score
                width: 60; height: 30
                Image {
                    anchors.centerIn: parent
                    scale: 0.4
                    source: "/run/media/root/linux_data/SuperMario_S/assets/img/ui/PTModelSprite_ID31370.png"
                }
            }
            Rectangle{
                //id:timer
                width: 60; height: 30
                Text {
                    anchors.centerIn: parent
                    text: "4`59"
                }
            }

        }
    }
    Component{
       id:delegate
       Row{
           y: 62
           width: 280
           height: 46
           anchors.horizontalCenterOffset: 0
           spacing: 80
           Rectangle{
               id:name
               width: 60; height: 30
               Text {
                   anchors.centerIn: parent
                   text: "name"
               }
           }
           Rectangle{
               id:score
               width: 60; height: 30
               Image {
                   anchors.centerIn: parent
                   scale: 0.4
                   source: "../../assets/img/ui/PTModelSprite_ID31370.png"
               }
           }
           Rectangle{
               id:timer
               width: 60; height: 30
               Text {
                   anchors.centerIn: parent
                   text: "4`59"
               }
           }

       }
    }
}
