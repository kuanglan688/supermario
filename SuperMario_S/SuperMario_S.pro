# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo
CONFIG += core wigets guit

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.yourcompany.wizardMSML.SuperMarioS
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = ""

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += #    resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    main.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

DISTFILES += \
    qml/common/PlatformerImageButton.qml \
    qml/common/AudioManager.qml \
    assets/audio/game/death.mp3 \
    assets/audio/game/level1.mp3 \
    assets/audio/game/success.mp3 \
    assets/audio/02.超级马里奥地底关卡.mp3 \
    assets/audio/03.超级马里奥水下关卡.mp3 \
    assets/audio/04.超级马里奥星星.mp3 \
    assets/audio/05.超级马里奥boss关卡.mp3 \
    assets/audio/07.5.超级马里奥最后.mp3 \
    assets/audio/PTModelSound_ID13612.mp3 \
    assets/audio/PTModelSound_ID14795.mp3 \
    assets/audio/PTModelSound_ID32200.mp3 \
    assets/audio/PTModelSound_ID32318.mp3 \
    qml/scenes/RankingScene.qml \
    qml/scenes/OptionScene.qml \
    assets/img/felgo-logo.png \
    qml/scenes/SceneBase.qml \
    qml/common/PlatformerSelectableImageButton.qml \
    assets/img/ui/backgroud3.png \
    assets/img/ui/level1.png \
    assets/img/ui/level2.png \
    assets/img/ui/level3.png \
    assets/img/ui/music.png \
    assets/img/ui/playMune.png \
    assets/img/ui/PTModelSprite_ID33986.png \
    assets/img/ui/PTModelSprite_ID35359.png \
    assets/img/ui/PTModelSprite_ID35384.png \
    assets/img/ui/PTModelSprite_ID35591.png \
    assets/img/ui/PTModelSprite_ID35597.png \
    assets/img/ui/PTModelSprite_ID35603.png \
    assets/img/ui/PTModelSprite_ID35609.png \
    assets/img/ui/PTModelSprite_ID35615.png \
    assets/img/ui/PTModelSprite_ID35621.png \
    assets/img/felgo-logo.png \
    assets/img/ui/backgroud3.png \
    assets/img/ui/music.png \
    assets/img/ui/playMune.png \
    assets/img/ui/PTModelSprite_ID33986.png \
    assets/img/ui/PTModelSprite_ID35359.png \
    assets/img/ui/PTModelSprite_ID35384.png \
    assets/img/ui/PTModelSprite_ID35591.png \
    assets/img/ui/PTModelSprite_ID35597.png \
    assets/img/ui/PTModelSprite_ID35603.png \
    assets/img/ui/PTModelSprite_ID35609.png \
    assets/img/ui/PTModelSprite_ID35615.png \
    assets/img/ui/PTModelSprite_ID35621.png
