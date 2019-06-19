import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{
    entityType: "home"

    width: homeImage.width*homeImage.scale
    height: homeImage.height*homeImage.scale

    MultiResolutionImage{
        id:homeImage
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/castle_finish.png"

    }

    PolygonCollider{
               width: parent.width
               height: parent.height
               vertices: [
                Qt.point(50,77),
                Qt.point(33,89),
                Qt.point(65,89),
                Qt.point(36,124),
                Qt.point(65,124)

               ]

               bodyType: Body.Static
               categories: Box.Category11
               collidesWith: Box.Category8 | Box.Category1
    }

}
