import QtQuick 2.0
import VPlay 2.0


EntityBase {
    id: player
    entityType: "player"

    SpriteSequenceVPlay {
        id: bird
        anchors.centerIn: parent

        SpriteVPlay {
            frameCount: 1
            frameRate: 10
            frameWidth: 34
            frameHeight: 24
            source: "../assets/img/birdSprite.png"
        }
    }

    CircleCollider {
        id: collider
        radius: 13
    }
}

