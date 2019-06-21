import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id:spikerock
    entityType: "spikerock"
    //    property alias source: image.source

    Column{
        Row{
            Repeater{
                model: widthSize
                MultiResolutionImage{
                    width: gameScene.gridSize
                    height: gameScene.gridSize
                    source: "../../assets/img/game/PTModelSprite_ID32779.png"
                }
            }
        }

        Repeater{
            model: heightSize-1
            Row{
                Repeater{
                    model: widthSize
                    MultiResolutionImage{
                        width: gameScene.gridSize
                        height: gameScene.gridSize
                        source:"../../assets/img/game/PTModelSprite_ID4224.png"
                    }
                }
            }
        }
    }

    BoxCollider{
        id: collider
        anchors.fill: parent
        bodyType: Body.Static

        categories: Box.Category10
        collidesWith: Box.Category1
    }

}
