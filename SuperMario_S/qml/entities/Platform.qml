import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{

    id:ground
    entityType: "platform"

    width: 130
    height: 50
    property int widthSize: 1
    Row{
        Repeater{
            model: widthSize
            MultiResolutionImage{
                id:platformImage
                source: "../../assets/img/game/PTModelSprite_ID2478.png"
            }
        }
    }

    BoxCollider{
        id: collider
        bodyType: Body.Static

        categories: Box.Category8
//        collidesWith: Box.Category1/*|Box.Category2*/
    }

}
