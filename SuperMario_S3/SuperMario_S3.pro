# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += \
#    resources_ParticleEditor.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# Uncomment for using iOS plugin libraries
# FELGO_PLUGINS += flurry

DISTFILES += \
    qml/scene/AboutPanel.qml \
    qml/ArrayStorage.js \
    qml/config.json \
    android/AndroidManifest.xml \
    android/res/values/strings.xml \
    android/res/drawable-hdpi/ic_launcher.png \
    android/res/drawable-mdpi/ic_launcher.png \
    android/res/drawable-xhdpi/ic_launcher.png \
    android/res/drawable-xxhdpi/ic_launcher.png \
    assets/img/+hd/background.png \
    assets/img/+hd/button-pullup.png \
    assets/img/+hd/button.png \
    assets/img/+hd/cob_click.png \
    assets/img/+hd/cob_hover.png \
    assets/img/+hd/cob_normal.png \
    assets/img/+hd/cocos_click.png \
    assets/img/+hd/cocos_hover.png \
    assets/img/+hd/cocos_normal.png \
    assets/img/+hd/felgo.png \
    assets/img/+hd/interactive_item_click.png \
    assets/img/+hd/interactive_item_hover.png \
    assets/img/+hd/interactive_item_normal.png \
    assets/img/+hd/item.png \
    assets/img/+hd/left_click.png \
    assets/img/+hd/left_hover.png \
    assets/img/+hd/left_normal.png \
    assets/img/+hd/link_click.png \
    assets/img/+hd/link_hover.png \
    assets/img/+hd/link_normal.png \
    assets/img/+hd/qt_click.png \
    assets/img/+hd/qt_hover.png \
    assets/img/+hd/qt_normal.png \
    assets/img/+hd/right_click.png \
    assets/img/+hd/right_hover.png \
    assets/img/+hd/right_normal.png \
    assets/img/+hd/slider-background.png \
    assets/img/+hd/slider-handle.png \
    assets/img/+hd/squaby_click.png \
    assets/img/+hd/squaby_hover.png \
    assets/img/+hd/squaby_normal.png \
    assets/img/+hd/switch-off.png \
    assets/img/+hd/switch-on.png \
    assets/img/+hd/switch-thumb.png \
    assets/img/+hd/textinput.png \
    assets/img/+hd/title_click.png \
    assets/img/+hd/title_hover.png \
    assets/img/+hd/title_normal.png \
    assets/img/+hd/window.png \
    assets/img/background.png \
    assets/img/button-pullup.png \
    assets/img/button.png \
    assets/img/cob_click.png \
    assets/img/cob_hover.png \
    assets/img/cob_normal.png \
    assets/img/cocos_click.png \
    assets/img/cocos_hover.png \
    assets/img/cocos_normal.png \
    assets/img/felgo.png \
    assets/img/interactive_item_click.png \
    assets/img/interactive_item_hover.png \
    assets/img/interactive_item_normal.png \
    assets/img/item.png \
    assets/img/left_click.png \
    assets/img/left_hover.png \
    assets/img/left_normal.png \
    assets/img/link_click.png \
    assets/img/link_hover.png \
    assets/img/link_normal.png \
    assets/img/qt_click.png \
    assets/img/qt_hover.png \
    assets/img/qt_normal.png \
    assets/img/right_click.png \
    assets/img/right_hover.png \
    assets/img/right_normal.png \
    assets/img/slider-background.png \
    assets/img/slider-handle.png \
    assets/img/squaby_click.png \
    assets/img/squaby_hover.png \
    assets/img/squaby_normal.png \
    assets/img/switch-off.png \
    assets/img/switch-on.png \
    assets/img/switch-thumb.png \
    assets/img/textinput.png \
    assets/img/title_click.png \
    assets/img/title_hover.png \
    assets/img/title_normal.png \
    assets/img/window.png \
    android/build.gradle \
    LICENSE.txt \
    qml/common/AudioManager.qml \
    qml/common/PlatformerImageButton.qml \
    qml/common/PlatformerSelectableImageButton.qml \
    qml/Main.qml \
    qml/scene/RankingScene.qml \
    qml/common/MenuButton.qml \
    qml/scene/SceneBase.qml \
    qml/scene/LevelScene.qml \
    qml/scene/MainMenu.qml \
    ../../simple/qml/MenuScene.qml \
    ../../simple/qml/GameButton.qml

SUBDIRS += \
    SuperMario_S3.pro
