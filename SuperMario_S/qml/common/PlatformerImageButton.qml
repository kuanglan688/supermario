import QtQuick 2.0
import QtQuick.Controls.Styles 1.0
import Felgo 3.0

//GameButton包装QtQuick控件按钮并使用GameStyle设置样式。
//要对颜色，字体或文本进行custimze，请使用自定义ButtonStyle。
//注意：GameButton等游戏控件已弃用，不再接收更新和修复。 相反，请使用Felgo App Controls。
GameButton{
     id:imageButton
     height: parent.height

     //设置按钮样式背景矩形的属性
     property int boderWidth: 1
     property color borderColor: "black"
     property int radius: 3
     property color color: "white"

     style: ButtonStyle{
         background: Rectangle{
             border.width: imageButton.boderWidth
             border.color: imageButton.borderColor
             radius: imageButton.radius

          gradient: Gradient{
                GradientStop{position:0.0; color: imageButton.color }
                //GradientStop{position: 1.0; Qt.tint(imageButton.color, "#24000000")}
          }
         }
     }
     onClicked: autdioManager.playSound("click")

     // the image displayed
     MultiResolutionImage {
       id: image

       anchors.fill: parent
       //anchors.margins: 1
       fillMode: Image.PreserveAspectFit
     }

     Rectangle {
       id: hoverRectangle
       anchors.fill: parent

       radius: imageButton.radius
       color: "white"

       //当鼠标悬停在按钮上时，这个矩形稍微可见
       opacity: hovered ? 0.3 : 0
     }
}
