import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: pipe
    entityType: "pipe"

    height: 90
    width: 1

    Image {
        id: lowerPipe
        source: "../assets/img/pipe_green.png"
        anchors.top: pipe.bottom
        anchors.horizontalCenter: pipe.horizontalCenter
    }

    Image {
        id: upperPipe
        source: "../assets/img/pipe_green.png"
        mirror: true
        rotation: 180
        anchors.bottom: pipe.top
        anchors.horizontalCenter: pipe.horizontalCenter
    }
}

