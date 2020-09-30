#!/bin/bash

#进入当前目录
cd `dirname $0`

#安装工具
yum install dos2unix -y

#加载配置
dos2unix * .env
source ${PWD}/.env



#初始化 filebrowser
mkdir -p $filebrowser_store
docker run --name filebrowser -d filebrowser/filebrowser:$filebrowser_version
docker cp filebrowser:/database.db ${filebrowser_store}/database.db
docker cp filebrowser:/.filebrowser.json ${filebrowser_store}/.filebrowser.json
docker rm -f filebrowser