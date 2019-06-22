#include "rank.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QFile>
#include <QDebug>


void Rank::read(const QJsonObject &json)
{
    if(json.contains("level1") && json["level1"].isObject()){
        level1->read(json["level1"].toObject());
        level1->print();
    }

    if(json.contains("level2") && json["level2"].isObject())
        level2->read(json["level2"].toObject());

    if(json.contains("level3") && json["level3"].isObject())
        level3->read(json["level3"].toObject());

}

void Rank::write(QJsonObject &json)
{

    QJsonObject level1Object;
    level1->write(level1Object);
    json["level1"] = level1Object;


    QJsonObject level2Object;
    level2->write(level2Object);
    json["level2"] = level2Object;

    QJsonObject level3Object;
    level3->write(level3Object);
    json["level3"] = level3Object;

}





bool Rank::loadGame()
{
    QFile loadFile("/home/mjr/data_qt/qt_practice/supermary/SuperMario_S/rank.json");

    if(!loadFile.open(QIODevice::ReadOnly | QIODevice::Text)){
      qDebug()<<"failed";
        return false;
    }


    QByteArray saveData = loadFile.readAll();

    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));

    QJsonObject object = loadDoc.object();

    read(object);

}

bool Rank::saveGame()
{
    QFile saveFile("/rank.json");
    if(!saveFile.open(QIODevice::WriteOnly)){
        qDebug()<<"failed!";
        return  false;
    }

    QJsonObject rankobject;

    write(rankobject);
    QJsonDocument saveDoc(rankobject);
    saveFile.write(saveDoc.toJson());

    return true;
}


void Rank::setMlevel1(Record* level)
{
    level1 = level;
}

Record* Rank::mlevel1()
{
    return  level1;
}

void Rank::setMlevel2(Record *level)
{
    level2 = level;
}

Record *Rank::mlevel2()
{
    return level2;
}

void Rank::setMlevel3(Record *level)
{
    level3 = level;
}

Record *Rank::mlevel3()
{
    return level3;
}

Rank::Rank(QObject *parent)
    :QObject(parent)
{

    level1 = new Record;
    level2 = new Record;
    level3 = new Record;
}
