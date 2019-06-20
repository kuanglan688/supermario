import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id:ground
    //    entityId: "entity"
    entityType: "ground"
    //    property alias source: image.source

    Column{
        Row{
            Repeater{
                model: widthSize
                MultiResolutionImage{
                    width: gameScene.gridSize
                    height: gameScene.gridSize
                    source: "../../assets/img/game/PTModelSprite_ID3790.png"
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

        categories: Box.Category8
        collidesWith:Box.Category1|Box.Category2|Box.Category3|Box.Category12|Box.Category14
    }

}
