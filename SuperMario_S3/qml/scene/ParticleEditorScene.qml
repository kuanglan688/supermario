import Felgo 3.0
import QtQuick 2.2

Scene {
    id: scene
    // this is important, as it serves as the reference size for the mass of the physics objects, because the mass of a body depends on the width of its images
    // use 480x320 (for landscape games) or 320x480 (for portrait games), as it then works on smaller devices as well
    // if you only want to target tablets, this size might be increased to e.g. 1024x768 when targeting iPad-only
    // when the screen size is bigger than the logical scene size defined here (e.g. 800x480), the content will be scaled automatically with the default scalemode "letterbox"
    // the scene can be placed in the bigger window with the properties sceneAlignmentX & sceneAlignmentY (both default to center)
    // so to use the remaining screen size and not show black borders around the edges, use a bigger background image
    // the recommended maximum background size is 576x368 for sd-images, and 1152x736 for hd-images and 2304x1472 for hd2-images
    // these factors are calculated by starting with a 3:2 aspect ratio (480x320) and considering the worst aspect ratios 16:9 and 4:3
    width: 480
    height: 320
    focus: true

    property alias mainMenu: mainMenu.menuEditor
    property alias entityMenu: itemEditor//(字体显示)
    property alias itemEditor: itemEditor.itemEditor

    property alias innerSpace: scene.innerSpaceWidth//(Panel大小)
    property alias aboutPanel: aboutPanel

    property int innerSpaceWidth: mainMenu.menuEditor.width-4*5

    AboutPanel {
        id: aboutPanel
        x: gameWindowAnchorItem.x
        y: gameWindowAnchorItem.y
    }


    // Left main menu
    MainMenu {
        id: mainMenu
        // always on top of all particles
        z:10
    }

    // Right entity property menu
    EntityPropertiesMenu {
        id: itemEditor
        // always on top of all particles
        z:10
    }

}








