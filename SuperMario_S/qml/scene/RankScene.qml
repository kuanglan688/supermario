import Felgo 3.0
import QtQuick 2.12

import "../entities"
import RankType 1.0
import RecordType 1.0

// EMPTY SCENE
SceneBase {
    id: rankScene

    //背景

    Rank{
        id:rank
    }

    property var leve1Level
    property var leve1Record
    property var leve1Holder
    property var leve2Level
    property var leve2Record
    property var leve2Holder
    property var leve3Level
    property var leve3Record
    property var leve3Holder
    Component.onCompleted: {
        rank.loadGame()

        leve1Level=rank.mlevel1.level
        leve1Record=rank.mlevel1.record
        leve1Holder=rank.mlevel1.holder

        leve2Level=rank.mlevel2.level
        leve2Record=rank.mlevel2.record
        leve2Holder=rank.mlevel2.holder

        leve3Level=rank.mlevel3.level
        leve3Record=rank.mlevel3.record
        leve3Holder=rank.mlevel3.holder
        model.append({
                         "level":leve1Level,
                         "cost":leve1Record,
                         "by":leve1Holder
                     })
        model.append({
                         "level":leve2Level,
                         "cost":leve2Record,
                         "by":leve2Holder
                     })
        model.append({
                         "level":leve3Level,
                         "cost":leve3Record,
                         "by":leve3Holder
                     })

    }
    BackgroundImage{
        id:bgimage
        anchors.fill: parent
        source: "../../assets/img/game/20190620165516.png"
    }
    //标题
    Text {
        id: ranking
        x: 385
        width: 177
        height: 101
        text: qsTr("Ranking")
        font.bold: false
        style: Text.Sunken
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        transformOrigin: Item.Center
        font.family: "URW Chancery L"
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50
    }
    //齿轮
    Wheel{
        x:parent.width - width/2*3
        y:0
    }
    //listview视图
    ListView {
        id: listView
        width: 730
        height: 399
        delegate: delegate
        model: model
        header: header
        clip: true
        spacing:20
        anchors.top: ranking.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
    }
    //listview代理
    Component {
        id: delegate
        Item {
            id: wrapper
            width: parent.width
            height: row.recheight


            Row {
                id:row
                property int recheight: rec.height
                Rectangle {
                    id:rec

                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#3300CCFF"}
                        GradientStop{position: 0.5; color: "#660099FF"}
                        GradientStop{position: 1.0; color: "#9999CCFF"}
                    }

                    //                    rotation: 90

                    //                    height: wrapper.width/3
                    //                    width: leveltext.height*1.5
                    width: wrapper.width/3
                    height: leveltext.height*1.5
                    //                    color: "#3300CCFF"
                    radius: height/3
                    Text {
                        //                        rotation: 270
                        anchors.centerIn: parent
                        id: leveltext
                        text: level
                        font.family: "TSCu_Comic"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 45
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: costtext.height*1.5
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#3300CCFF"}
                        GradientStop{position: 0.5; color: "#660099FF"}
                        GradientStop{position: 1.0; color: "#9999CCFF"}
                    }
                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: costtext
                        text: cost
                        font.family: "TSCu_Comic"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 45
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: bytext.height*1.5
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#3300CCFF"}
                        GradientStop{position: 0.5; color: "#660099FF"}
                        GradientStop{position: 1.0; color: "#9999CCFF"}
                    }
                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: bytext
                        text: by
                        font.family: "TSCu_Comic"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 45
                    }
                }
            }
        }
    }
    //listview头部
    Component {
        id: header
        Item {
            id: wrapper
            width: parent.width
            height: row.recheight


            Row {
                id:row
                property int recheight: rec.height
                Rectangle {
                    id:rec

                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#99FF6666"}
                        GradientStop{position: 0.5; color: "red"}
                        GradientStop{position: 1.0; color: "#33FFCCCC"}
                    }

                    //                    rotation: 90

                    //                    height: wrapper.width/3
                    //                    width: leveltext.height*1.5
                    width: wrapper.width/3
                    height: leveltext.height*1.5/2
                    //                    color: "#3300CCFF"
                    //                    radius: height/3
                    Text {
                        //                        rotation: 270
                        anchors.centerIn: parent
                        id: leveltext
                        text: "level"
                        font.family: "URW Chancery L"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 45
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: costtext.height*1.5/2
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#99FF6666"}
                        GradientStop{position: 0.5; color: "red"}
                        GradientStop{position: 1.0; color: "#33FFCCCC"}
                    }

                    //                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: costtext
                        text: "record"
                        font.family: "URW Chancery L"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 45
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: bytext.height*1.5/2
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#99FF6666"}
                        GradientStop{position: 0.5; color: "red"}
                        GradientStop{position: 1.0; color: "#33FFCCCC"}
                    }

                    //                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: bytext
                        text: "holder"
                        font.family: "URW Chancery L"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 45
                    }
                }
            }
        }
    }

    //    Rank{
    //    id:rank

    //    }
    //listview模型

    ListModel {
        id: model
    }

    //主菜单按钮
    OurGameButtons{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*0.08

        anchors.horizontalCenter: parent.horizontalCenter
        width: text.width/2
        height: parent.height*0.1
        text.font.pointSize: 30
        text.color: "red"
        text.text: "menu"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menu"
            }
        }
    }

}


//import Felgo 3.0
//import QtQuick 2.12

//import "../entities"

//// EMPTY SCENE
//SceneBase {
//    id: rankScene

//    //背景
//    BackgroundImage{
//        id:bgimage
//        anchors.fill: parent
//        source: "../../assets/img/game/20190620165516.png"
//    }
//    //标题
//    Text {
//        id: ranking
//        x: 385
//        width: 177
//        height: 101
//        text: qsTr("Ranking")
//        font.bold: false
//        style: Text.Sunken
//        anchors.horizontalCenterOffset: 1
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: parent.top
//        anchors.topMargin: 20
//        transformOrigin: Item.Center
//        font.family: "URW Chancery L"
//        renderType: Text.NativeRendering
//        verticalAlignment: Text.AlignVCenter
//        horizontalAlignment: Text.AlignHCenter
//        font.pixelSize: 50
//    }
//    //齿轮
//    Wheel{
//        x:parent.width - width/2*3
//        y:0
//    }
//    //listview视图
//    ListView {
//        id: listView
//        width: 730
//        height: 399
//        delegate: delegate
//        model: model
//        header: header
//        clip: true
//        spacing:20
//        anchors.top: ranking.bottom
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.horizontalCenterOffset: 0
//    }
//    //listview代理
//    Component {
//        id: delegate
//        Item {
//            id: wrapper
//            width: parent.width
//            height: row.recheight


//            Row {
//                id:row
//                property int recheight: rec.height
//                Rectangle {
//                    id:rec

//                    gradient: Gradient{
//                        GradientStop{position: 0.0; color: "#3300CCFF"}
//                        GradientStop{position: 0.5; color: "#660099FF"}
//                        GradientStop{position: 1.0; color: "#9999CCFF"}
//                    }

////                    rotation: 90

////                    height: wrapper.width/3
////                    width: leveltext.height*1.5
//                    width: wrapper.width/3
//                    height: leveltext.height*1.5
////                    color: "#3300CCFF"
//                    radius: height/3
//                    Text {
////                        rotation: 270
//                        anchors.centerIn: parent
//                        id: leveltext
//                        text: level
//                        font.family: "TSCu_Comic"
//                        font.bold: true
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter
//                        font.pointSize: 45
//                    }
//                }
//                Rectangle {
//                    width: wrapper.width/3
//                    height: costtext.height*1.5
//                    gradient: Gradient{
//                        GradientStop{position: 0.0; color: "#3300CCFF"}
//                        GradientStop{position: 0.5; color: "#660099FF"}
//                        GradientStop{position: 1.0; color: "#9999CCFF"}
//                    }
//                    radius: height/3
//                    Text {
//                        anchors.centerIn: parent
//                        id: costtext
//                        text: cost
//                        font.family: "TSCu_Comic"
//                        font.bold: true
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter
//                        font.pointSize: 45
//                    }
//                }
//                Rectangle {
//                    width: wrapper.width/3
//                    height: bytext.height*1.5
//                    gradient: Gradient{
//                        GradientStop{position: 0.0; color: "#3300CCFF"}
//                        GradientStop{position: 0.5; color: "#660099FF"}
//                        GradientStop{position: 1.0; color: "#9999CCFF"}
//                    }
//                    radius: height/3
//                    Text {
//                        anchors.centerIn: parent
//                        id: bytext
//                        text: by
//                        font.family: "TSCu_Comic"
//                        font.bold: true
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter
//                        font.pointSize: 45
//                    }
//                }
//            }
//        }
//    }
//    //listview头部
//    Component {
//        id: header
//        Item {
//            id: wrapper
//            width: parent.width
//            height: row.recheight


//            Row {
//                id:row
//                property int recheight: rec.height
//                Rectangle {
//                    id:rec

//                    gradient: Gradient{
//                        GradientStop{position: 0.0; color: "#99FF6666"}
//                        GradientStop{position: 0.5; color: "red"}
//                        GradientStop{position: 1.0; color: "#33FFCCCC"}
//                    }

//                    //                    rotation: 90

//                    //                    height: wrapper.width/3
//                    //                    width: leveltext.height*1.5
//                    width: wrapper.width/3
//                    height: leveltext.height*1.5/2
//                    //                    color: "#3300CCFF"
////                    radius: height/3
//                    Text {
//                        //                        rotation: 270
//                        anchors.centerIn: parent
//                        id: leveltext
//                        text: "level"
//                        font.family: "URW Chancery L"
//                        font.bold: true
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter
//                        font.pointSize: 45
//                    }
//                }
//                Rectangle {
//                    width: wrapper.width/3
//                    height: costtext.height*1.5/2
//                    gradient: Gradient{
//                        GradientStop{position: 0.0; color: "#99FF6666"}
//                        GradientStop{position: 0.5; color: "red"}
//                        GradientStop{position: 1.0; color: "#33FFCCCC"}
//                    }

////                    radius: height/3
//                    Text {
//                        anchors.centerIn: parent
//                        id: costtext
//                        text: "record"
//                        font.family: "URW Chancery L"
//                        font.bold: true
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter
//                        font.pointSize: 45
//                    }
//                }
//                Rectangle {
//                    width: wrapper.width/3
//                    height: bytext.height*1.5/2
//                    gradient: Gradient{
//                        GradientStop{position: 0.0; color: "#99FF6666"}
//                        GradientStop{position: 0.5; color: "red"}
//                        GradientStop{position: 1.0; color: "#33FFCCCC"}
//                    }

////                    radius: height/3
//                    Text {
//                        anchors.centerIn: parent
//                        id: bytext
//                        text: "holder"
//                        font.family: "URW Chancery L"
//                        font.bold: true
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter
//                        font.pointSize: 45
//                    }
//                }
//            }
//        }
//    }
//    //listview模型
//    ListModel {
//        id: model
//        ListElement {
//            level: " level 1 "
//            cost: "3'12''"
//            by: "Tom"
//        }
//        ListElement {
//            level: " level 2 "
//            cost: "2'16''"
//            by: "Marry"
//        }
//        ListElement {
//            level: " level 3 "
//            cost: "3'12''"
//            by: "Bob"
//        }
//    }
//    //主菜单按钮
//    OurGameButtons{
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: parent.height*0.08

//        anchors.horizontalCenter: parent.horizontalCenter
//        width: text.width/2
//        height: parent.height*0.1
//        text.font.pointSize: 30
//        text.color: "red"
//        text.text: "menu"
//        MouseArea{
//            anchors.fill: parent
//            onClicked: {
//                gameWindow.state = "menu"
//            }
//        }
//    }

//}
///*
////    OurGameButtons{
////        anchors.bottom: parent.bottom
////        anchors.bottomMargin: parent.height*0.08
////        anchors.left: parent.left
////        anchors.leftMargin: parent.width*0.15
////        width: text.width
////        height: parent.height*0.1
////        text.font.pointSize: 30
////        text.text: "好棒啊"
////    }


////    Column {
////        z: -1
////        Repeater {
////            id: repeater
////            model: 10
////            Rectangle {
////                width: rankScene.width
////                height: rankScene.height / 10
////                gradient: Gradient {
////                    GradientStop {
////                        position: 0.0
////                        color: "#FF6699"
////                    }
////                    GradientStop {
////                        position: 0.5
////                        color: "#FFCCFF"
////                    }
////                    GradientStop {
////                        position: 1.0
////                        color: "#FF6699"
////                    }
////                }
////            }
////        }
////    }
//*/
