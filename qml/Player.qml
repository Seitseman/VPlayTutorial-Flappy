import QtQuick 2.0
import VPlay 2.0


EntityBase {
    id: player
    entityType: "player"
    rotation: collider.linearVelocity.y/10

    SpriteSequenceVPlay {
        id: bird
        anchors.centerIn: parent
        running: scene.gameState !== "gameOver"

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

    function push() {
        collider.body.linearVelocity = Qt.point(0,0)
        var localForwardVector = collider.body.getWorldVector(Qt.point(0,-200))
        collider.body.applyLinearImpulse(localForwardVector, collider.body.getWorldCenter())
    }
}

