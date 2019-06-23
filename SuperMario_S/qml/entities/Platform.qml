import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{

    id:platform
    entityType: "platform"

    width: 130*widthSize
    height: 50

    property int widthSize: 1 //横向个数

    //重复platform
    Row{
        Repeater{
            model: widthSize
            MultiResolutionImage{
                id:platformImage
                source: "../../assets/img/game/PTModelSprite_ID2478.png"
            }
        }
    }

    //碰撞区域
    BoxCollider{
        id: collider
        bodyType: Body.Static

        categories: Box.Category8
//        collidesWith: Box.Category1/*|Box.Category2*/
    }

}
