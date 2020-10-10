#!/bin/sh

#如果
ls /tmp/backup/



if [ ! -f "/db/database.db" ];then
 cp /tmp/backup/database.db /db/database.db
 echo "copy database.db"
fi



#启动服务
/filebrowser