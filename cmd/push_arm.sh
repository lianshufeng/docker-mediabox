#!/bin/bash

#进入当前目录
workdir=$(cd $(dirname $0); pwd)/../
cd $workdir


#拉取
docker pull lianshufeng/mediabox_nginx:arm
docker pull lianshufeng/mediabox_filebrowser:arm
docker pull lianshufeng/mediabox_ariang:arm
docker pull lianshufeng/mediabox_jellyfin:arm
docker pull lianshufeng/mediabox_samba:arm


#更改tag
docker tag lianshufeng/mediabox_nginx:arm registry.cn-chengdu.aliyuncs.com/mediabox/docker-nginx:arm
docker tag lianshufeng/mediabox_filebrowser:arm registry.cn-chengdu.aliyuncs.com/mediabox/docker-filebrowser:arm
docker tag lianshufeng/mediabox_ariang:arm registry.cn-chengdu.aliyuncs.com/mediabox/docker-ariang:arm
docker tag lianshufeng/mediabox_jellyfin:arm registry.cn-chengdu.aliyuncs.com/mediabox/docker-jellyfin:arm
docker tag lianshufeng/mediabox_samba:arm registry.cn-chengdu.aliyuncs.com/mediabox/docker-samba:arm


#推送
docker push registry.cn-chengdu.aliyuncs.com/mediabox/docker-nginx:arm
docker push registry.cn-chengdu.aliyuncs.com/mediabox/docker-filebrowser:arm
docker push registry.cn-chengdu.aliyuncs.com/mediabox/docker-ariang:arm
docker push registry.cn-chengdu.aliyuncs.com/mediabox/docker-jellyfin:arm
docker push registry.cn-chengdu.aliyuncs.com/mediabox/docker-samba:arm