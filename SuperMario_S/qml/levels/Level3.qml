import Felgo 3.0
import QtQuick 2.0
import "../entities"

Item {
    id: level3
    Ground{
        id:l3_1
        widthSize:5
        heightSize:2
        column:1
        row:heightSize
    }
    Ground{
        id:l3_2
        widthSize:5
        heightSize:2
        column:l3_1.widthSize
        row:heightSize
    }
    Ground{
        id:l3_3
        widthSize:5
        heightSize:2
        column:l3_2.column+l3_2.widthSize
        row:heightSize
    }
    Spikerock{
        id:l3_4
        widthSize:40
        heightSize:1
        column:l3_3.column+l3_3.widthSize
        row:heightSize
    }
    Platform{
        id:l3_5
        column:l3_3.column+l3_3.widthSize+3
        row:6
    }
    Wheel{
        id:l3_55
        column:l3_3.column+l3_3.widthSize+5
        row: 8
    }

    Platform{
        id:l3_6
        column:l3_3.column+l3_3.widthSize+8
        row:9
    }

    Wheel{
        id:l3_66
        column:l3_3.column+l3_3.widthSize+10
        row: 11
    }

    Platform{
        id:l3_7
        column:l3_3.column+l3_3.widthSize+13
        row:12
    }
    Mushroom{
        id:l3_77
        column:l3_3.column+l3_3.widthSize+14
        row:14
    }

    Platform{
        id:l3_8
        column:l3_3.column+l3_3.widthSize+21
        row:9
    }
    Wheel{
        id:l3_88
        column:l3_3.column+l3_3.widthSize+21
        row: 11
    }

    Platform{
        id:l3_9
        column:l3_3.column+l3_3.widthSize+29
        row:6
    }
    Wheel{
        id:l3_99
        column:l3_3.column+l3_3.widthSize+29
        row: 8
    }
    Ground{
        id:l3_10
        widthSize:50
        heightSize:2
        column:l3_4.column+l3_4.widthSize
        row:heightSize
    }
    Scorpion{
        id:l3_11
        column: l3_10.column+l3_10.widthSize/3
        row:10
    }
    Scorpion{
        id:l3_12
        column: l3_10.column+l3_10.widthSize/3*2
        row:10
    }
    Coin{
        id:l3_13
        column: l3_10.column+l3_10.widthSize/3*2
        row:11
    }
    Coin{
        id:l3_13_1
        column: l3_10.column+l3_10.widthSize/3*2+2
        row:11
    }
    Coin{
        id:l3_13_2
        column: l3_10.column+l3_10.widthSize/3*2+6
        row:11
    }
    Coin{
        id:l3_13_3
        column: l3_10.column+l3_10.widthSize/3*2+8
        row:11
    }
    Coin{
        id:l3_14
        column: l3_10.column+5
        row:11
    }
    Coin{
        id:l3_14_1
        column: l3_10.column+7
        row:11
    }
    Coin{
        id:l3_14_2
        column: l3_10.column+9
        row:11
    }
    Coin{
        id:l3_14_3
        column: l3_10.column+11
        row:11
    }
    Trampoline{

    }

    Trampoline{
        id:l3_15
//        widthSize:50
//        heightSize:2
        column:l3_10.column+l3_10.widthSize - 2
        row:3
    }
    Platform{
        id:l3_16
        widthSize: 9
        column:l3_10.column+l3_10.widthSize + 3
        row:10 + 2
    }
    Snail{
        id:l3_16_1
        column: l3_10.column+l3_10.widthSize + 4
        row: 20
    }

    Water{
        id:l3_17
        widthSize: 50
        heightSize: 1
        column:l3_10.column+l3_10.widthSize
        row:heightSize
    }
}

