import Felgo 3.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640

    activeScene: mainMenuScene
    state: "main"

    EntityManager {
        id: entityManager
    }


    //场景-------------------------------------------------------------------------
    //主菜单场景
    MenuScene {
        id: mainMenuScene

        //根据信号，切换场景
        onLevelScenePressed: gameWindow.state = "level"
        onOptionScenePressed: gameWindow.state = "option"
        onRankingScenePressed: gameWindow.state = "ranking"
        // 菜单场景是我们的开始场景，因此如果按下back，我们会询问用户是否想退出应用程序
        onBackButtonPressed: {
            nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
        }
        // listen to the return value of the MessageBox
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                // 只有当activeScene是mainMenuScene时才退出——消息框也可能从代码中的其他场景打开，我们在这里询问用户是否想退出应用程序
                if(accepted && window.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }

    // scene for selecting levels
    LevelScene {
        id:levelScene
        onLevelScenenPressed: {
            // selectedLevel is the parameter of the levelPressed signal
            gameScene.setLevel(levelScene)
            window.state = "game"

        }
        onBackButtonPressed: window.state = "main"
    }

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "main"
            PropertyChanges {target: mainMenuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene:  mainMenuScene}
        },
        State {
            name: "level"
            PropertyChanges {target: levelScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: levelScene}
        },
        State {
            name: "option"
            PropertyChanges {target: optionScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: optionScene}
        },
        State {
            name: "ranking"
            PropertyChanges { target: rankingScene; opactity: 1 }
            PropertyChanges { target: gameWindow; activeScene:rankingScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
        }
    ]
}
