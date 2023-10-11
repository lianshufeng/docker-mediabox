#!/bin/sh


#更新db
docker run -d --name filebrowser filebrowser/filebrowser:v2.25.0
docker cp filebrowser:/.filebrowser.json .filebrowser.json
#docker cp filebrowser:/database.db database.db #不需要拷贝,不存在会自动新建
docker rm -f filebrowser

#更新路径
sed -i "s/\/database.db/\/db\/database.db/g" .filebrowser.json
