import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    // You get free licenseKeys from http://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from http://v-play.net/licenseKey>"

    activeScene: scene

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    width: 960
    height: 640

    EntityManager {
        id: entityManager
        entityContainer: scene
    }

    Scene {
        id: scene
        sceneAlignmentY: "bottom"

        property string gameState: "wait"
        property int score: 0

        PhysicsWorld {
            debugDrawVisible: true
            gravity.y: scene.gameState !== "wait" ? -27 : 0
            z: 10
        }

        Image {
            id: bg
            source: "../assets/img/bg.png"
            anchors.horizontalCenter: scene.horizontalCenter
            anchors.bottom: scene.gameWindowAnchorItem.bottom
        }

        Ground {
            anchors.horizontalCenter: scene.horizontalCenter
            anchors.bottom: scene.gameWindowAnchorItem.bottom
        }

        Player {
            id: player
            x: 160
            y: 180
        }

        Pipe {
            id: pipe1
            x: 400
            y: 30 + Math.random()*200
        }

        Pipe {
            id: pipe2
            x: 640
            y: 30 + Math.random() * 200
        }

        Text {
            id: scoreText
            text: scene.score
            color: "white"
            anchors.horizontalCenter: scene.horizontalCenter
            y: 30
            font.pixelSize: 30
        }

        MouseArea {
            anchors.fill: scene.gameWindowAnchorItem
            onPressed: {
                if (scene.gameState === "wait") {
                    scene.startGame()
                    player.push()
                } else if (scene.gameState === "play") {
                    player.push()
                } else if (scene.gameState === "gameOver") {
                    scene.reset()
                }
            }
        }

        function startGame() {
            scene.gameState = "play"
        }

        function stopGame() {
            scene.gameState = "gameOver"
        }

        function reset() {
            scene.gameState = "wait"
            pipe1.x = 400
            pipe1.y = 30 + Math.random()*200
            pipe2.x = 640
            pipe2.y = 30 + Math.random()*200
            player.x = 160
            player.y = 180
            scene.score = 0
        }
    }

}

