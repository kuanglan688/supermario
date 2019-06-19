import Felgo 3.0
import QtQuick 2.2
import "particles"
Item {
    id: about
    width: gameWindowAnchorItem.width
    height: gameWindowAnchorItem.height

    property bool closed: true


    //打开Panel
    function closePanel() {
        if(!aboutPane.visible)
            return

        // Log open about panel
        flurry.logEvent("OpenAbout")

        aboutPane.transform()
        clipping.transform()
    }
    Item {
        id: aboutPane
        width: parent.width
        height: 0
        visible: false

        onHeightChanged: {
            if(height <= 0) {
                aboutPane.visible = false
            } else {
                aboutPane.visible = true
            }
        }
        Item {
            id: aboutImage
            height: aboutPane.height+10
            width: aboutPane.width
            clip: true
            property int aboutPanelNumber: 1

            onAboutPanelNumberChanged: {
                if(aboutPanelNumber<1) {
                    aboutPanelNumber = 4
                }
                if(aboutPanelNumber > 4) {
                    aboutPanelNumber = 1
                }

            }

        }}}
