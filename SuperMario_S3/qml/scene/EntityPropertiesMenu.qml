import Felgo 3.0
import QtQuick 2.2

Item {
  id: itemEditorWrapper
  property alias itemEditor: itemEditor
  property alias state: itemEditor.state

  width: scene.gameWindowAnchorItem.width/2.5
  height : scene.gameWindowAnchorItem.height


  ItemEditor {
    id: itemEditor
    property bool dataStorageLocation: false
  }

  // Move out of the screen
  x: __outslidedX
  y: scene.gameWindowAnchorItem.y
  // Save the x position when the editor is slided out completely
  property int __outslidedX:  scene.gameWindowAnchorItem.x+scene.gameWindowAnchorItem.width

  // Add an additional offset to move the editor inside/outside of the visible screen.
  property int offsetX: __outslidedX-itemEditor.width

  // The duration of the slide animation for this editor
  property int slideDuration: 800

  // status at the beginning is outside
  property bool sliderOut: true
  Behavior on x {
    SmoothedAnimation { duration: itemEditorWrapper.slideDuration; easing.type: Easing.InOutQuad }
  }

  onXChanged: {
    if(x >= __outslidedX) {
      itemEditor.visible = false
    } else {
      itemEditor.visible = true
    }
  }




}
