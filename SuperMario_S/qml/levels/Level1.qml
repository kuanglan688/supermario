import Felgo 3.0
import QtQuick 2.0
import "../entities"

Item {
    id: level1
    Ground{
         //        x:0
         //        y:0
         widthSize: 8//要得个数
         heightSize:5//总排数
         column:1//为了算x、y
         row:5
     }
    Ground{
        widthSize:17
        heightSize:3
        column: 9
        row:3

    }
    Water{
        widthSize: 4
        heightSize:2
        column:26
        row:2

    }
    Ground{
         widthSize: 15//要得个数
         heightSize: 4//总排数
         column:30//为了算x、y
         row:4
     }
    Ground{
        widthSize: 4
        heightSize: 5
        column: 45
        row:5

    }
    Water{
        widthSize: 12
        heightSize: 2
        column: 49
        row:2

    }
    Platform{
        widthSize: 1
        heightSize: 1
        column:54
        row:12
    }//
    Platform{
        widthSize: 1
        heightSize: 1
        column:52
        row:7
    }//
    Ground{
         widthSize: 15
         heightSize: 7
         column:61
         row:7
     }
    Water{
        widthSize: 5
        heightSize: 2
        column: 76
        row:2

    }

    Ground{
        widthSize: 5
        heightSize: 9
        column: 81
        row:9
    }
    Ground{
         widthSize: 5
         heightSize: 7
         column:86
         row:7
     }
    Ground{
        widthSize: 5
        heightSize: 5
        column: 91
        row:5
    }
    Ground{
        widthSize: 5
        heightSize: 3
        column: 96
        row:3
    }

    Water{
        widthSize: 3
        heightSize: 2
        column: 101
        row:2
    }
    Ground{
        widthSize: 3
        heightSize: 3
        column: 104
        row:3
    }
    Spikerock{
        widthSize: 4
        heightSize: 2
        column: 107
        row:2
    }
    Ground{
        widthSize: 2
        heightSize: 5
        column: 111
        row:5
    }
    Water{
        widthSize: 8
        heightSize: 2
        column: 113
        row:2
    }
    Ground{
        widthSize: 4
        heightSize: 5
        column: 121
        row:5
    }
    Ground{
        widthSize: 25
        heightSize: 3
        column: 125
        row:3
    }
    Ground{
        widthSize: 5
        heightSize: 5
        column: 150
        row:5
    }
    Ground{
        widthSize:5
        heightSize: 7
        column: 155
        row:7
    }
    Ground{
        widthSize: 5
        heightSize: 9
        column: 160
        row:9
    }
    Water{
        widthSize: 25
        heightSize: 2
        column: 165
        row:2
    }
    Platform{
        widthSize: 1
        heightSize:8
        column: 172
        row:8
    }
    Platform{
        widthSize: 1
        heightSize: 10
        column: 179
        row:10
    }
    Ground{
        widthSize: 20
        heightSize: 7
        column: 190
        row:7
    }
    Home{
         column: 200
         row:10.5

    }
    Water{
        widthSize: 100
        heightSize: 2
        column: 210
        row:2
    }
    Snail{
        column: 140
        row:3
    }
}

