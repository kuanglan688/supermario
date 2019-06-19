/*
  This style enables the GUI Elements and ItemEditor styles from VPlay 1.0.
  */
import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls.Styles 1.1

Item {

  property alias buttonStyle:buttonStyleComponent

  /*!
    This alias is used to access the switchStyle. Used for instance in GameSwitch to assign the GameStyle to the QtQuick Controls Switch element.
    \sa GameSwitch
  */
 // property alias switchStyle:switchStyleComponent

  /*!
    This alias is used to access the sliderStyle. Used for instance in GameSlider to assign the GameStyle to the QtQuick Controls Slider element.
    \sa GameSlider
  */
  property alias sliderStyle:sliderStyleComponent

  /*!
    This alias is used to access the textFieldStyle. Used for instance in GameTextField to assign the GameStyle to the QtQuick Controls TextField element.
    \sa GameTextField
  */
  property alias textFieldStyle:textFieldStyleComponent

  /*!
    This alias is used to access the scrollViewStyle. Used for instance in GameScrollView to assign the GameStyle to the QtQuick ScrollView element.
    \sa GameScrollView
  */

  /*!
    This alias is used to access the itemEditorStyle. Used for instance in ItemEditor to assign the GameStyle to the QtQuick GUI elements.
    \sa ItemEditor
    \sa ItemEditorStyle
  */
  property alias itemEditorStyle:itemEditorStyle

  /*!
    This property is used to change the color of the window background in GUI elements and in the ItemEditor.
    \sa ItemEditor
    \sa ItemEditorStyle
  */
  property color windowBackgroundColor: "#212126"

  /*!
    This property is used to change the color of the background in GUI elements.
  */
  property color elementBackgroundColor: "#2c2b2a"

  /*!
    This property is used to change the color of the foreground in GUI elements.
  */
  property color elementForegroundColor: "#413d3c"

  /*!
    This property is used to change the color of the highlight effects in GUI elements.
  */
  property color elementHighlightColor: Qt.lighter("#468bb7", 1.2)

  /*!
    This property is used to change the color of the highlight effects when the element is not hovered or pressed in GUI elements.
  */
  property color elementNormalColor: Qt.darker("#468bb7", 1.4)

  /*!
    This property is used to change the color of the GameButton text.
  */
  property color buttonTextColor: "white"

  /*!
    This property is used to change the pixel size of the GameButton text.
  */
  property int buttonTextPixelSize: 12

  /*!
    This property is used to change the color of the GameSwitch text.
  */
  property color switchTextColor: "white"

  /*!
    This property is used to change the pixel size of the GameSwitch text.
  */
  property int switchTextPixelSize: 11
  /*!
    This property is used to change the color of the GameTextField text.
  */
  property color textFieldTextColor: "white"

  /*!
    This property is used to change the color of the placeholder text of the GameTextField.
  */
  property color textFieldPlaceholderTextColor: "grey"

  /*!
    This property is used to change the pixel size of the GameTextField text.
  */
  property int textFieldTextPixelSize: 14

  /*!
    This property is used to change the color of the itemEditor label text.
  */
  property color itemEditorLabelTextColor: "black"

  /*!
    This property is used to change the pixel size of the itemEditor label text.
  */
  property int itemEditorLabelTextPixelSize: 11

  /*!
    This alias is used to change the font of the itemEditor label.
  */
  property alias itemEditorLabel: itemEditorLabel

  // Button Style
  Component {
    id: buttonStyleComponent
    ButtonStyle {
      panel: MultiResolutionImage {
        implicitHeight: 27
        implicitWidth: 69
        scale: control.pressed ? 0.9 : 1
        source: "../../assets/img/button.png"
        Text {
          text: control.text
          anchors.centerIn: parent
          color: buttonTextColor
          font.pixelSize: buttonTextPixelSize
          // causes bad fonts and other problems http://qt-project.org/forums/viewthread/22158
          //renderType: Text.NativeRendering
          renderType: Text.QtRendering
        }
      }
    }
  }





  // Slider Style
  Component {
    id: sliderStyleComponent
    SliderStyle {
      handle: MultiResolutionImage {
        implicitHeight: 38
        implicitWidth: 38
        source: "../../assets/img/slider-handle.png"
      }
    }
  }


  // TextField Style
  Component {
    id: textFieldStyleComponent
    TextFieldStyle {

      background: Item {
        implicitHeight: 25
        implicitWidth: 160
        MultiResolutionImage {
          //source: "../assets/img/textinput.png"
          implicitHeight: 6
          implicitWidth: 160
          anchors.bottom: parent.bottom
          anchors.left: parent.left
          anchors.right: parent.right
        }
      }
    }
  }


  // ItemEditor Style(背景颜色)
  ItemEditorStyle {
      id: itemEditorStyle

      label: Text {
        id: itemEditorLabel
        color: itemEditorLabelTextColor
        font.pixelSize: itemEditorLabelTextPixelSize
      }
    }
}
