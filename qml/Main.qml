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

        PhysicsWorld {
            debugDrawVisible: true
            gravity.y: -27
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
        MouseArea {
            anchors.fill: scene.gameWindowAnchorItem
            onPressed: {
                player.push()
            }
        }
    }

}

