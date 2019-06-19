import Felgo 3.0
import QtQuick 2.2

Column {
  id: column
  property int cnt: sliderCount.value
  property int buttonHeight: 30
  property variant dialogCaller
  property string oldName: ""

  width: innerSpace
  anchors.horizontalCenter: parent.horizontalCenter

  spacing: 6


  Text {
      color: "orange"
      text: "Volume  "+column.cnt
  }
  GameSlider {
      id: volumeCount
      width: column.width
      maximumValue: 30
      value: 1
      stepSize: 1
  }
  Text {
    color: "white"
    text: "Creation Count "+column.cnt
  }
  GameSlider {
    id: sliderCount
    width: column.width
    maximumValue: 30
    value: 1
    stepSize: 1
  }
  GameButton {
    width: column.width
    height: column.buttonHeight
    text: "Add "+scene.itemEditor.currentEditableType
    onClicked: {

    }
  }
  GameButton {
    width: column.width
    height: column.buttonHeight
    text: "Add "+scene.itemEditor.currentEditableType
    onClicked: {

    }
  }


}

