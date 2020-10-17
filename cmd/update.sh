#!/bin/bash

#获取当前执行的脚本文件的父目录
workdir=$(cd $(dirname $0); pwd)/../

echo $workdir

# update project function
UpdateProject(){
	echo "url : "$1
	echo "fileName : "$2
	echo "folder : "$3
	echo "projectName : "$4
	
	cd $workdir
	
	#下载到临时目录
	rm -rf $4
	mkdir -p $4
	rm -rf /tmp/$4
	mkdir -p /tmp/$4
	
	cd /tmp/$4
	wget $1 -O master.zip
	#解压到临时目录
	unzip master.zip
	#拷贝到外部目录
	cp -rf /tmp/$4/$2/$3/* $workdir/$4/
	
	#删除临时目录
	rm -rf /tmp/$4

	
	#alpine-阿里
	sed -i "/FROM alpine/a\RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories" $workdir/$4/Dockerfile
	sed -i "/FROM node:alpine/a\RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories" $workdir/$4/Dockerfile
	
	
	
	#ubuntu-阿里
	sed -i "/FROM ubuntu/a\RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list" $workdir/$4/Dockerfile
	sed -i "/FROM ubuntu/a\RUN sed -i 's/security.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list" $workdir/$4/Dockerfile
	
	sed -i "/FROM lsiobase\/ubuntu/a\RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list" $workdir/$4/Dockerfile
	sed -i "/FROM lsiobase\/ubuntu/a\RUN sed -i 's/security.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list" $workdir/$4/Dockerfile
	
	
	#debian-阿里
	sed -i "/FROM debian/a\RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list" $workdir/$4/Dockerfile
	sed -i "/FROM debian/a\RUN sed -i 's/security.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list" $workdir/$4/Dockerfile
	
	
	echo "finish -> "$4
}


# minidlna
# UpdateProject "https://github.com/vladgh/docker_base_images/archive/master.zip" "docker_base_images-master" "minidlna" "docker-minidlna"

#jellyfin
#UpdateProject "https://github.com/linuxserver/docker-jellyfin/archive/master.zip" "docker-jellyfin-master" "." "docker-jellyfin"


# samba
UpdateProject "https://github.com/dperson/samba/archive/master.zip" "samba-master"  "." "docker-samba"
#增加编译环境的权限设置
sed -i "/ENTRYPOINT/i\RUN chmod -R 777 /usr/bin/samba.sh" $workdir/docker-samba/Dockerfile
sed -i "/ENTRYPOINT/i\RUN chmod -R 777 /usr/bin/samba.sh" $workdir/docker-samba/Dockerfile.armhf
#禁用推送钩子
rm -rf $workdir/docker-samba/hooks
cp -r $workdir/docker-nginx/hooks $workdir/docker-samba/hooks





# 同步 README.md
rm -rf $workdir/docker-samba/README.md ; cp $workdir/README.md $workdir/docker-samba/
rm -rf $workdir/docker-nginx/README.md ; cp $workdir/README.md $workdir/docker-nginx/
rm -rf $workdir/docker-jellyfin/README.md ; cp $workdir/README.md $workdir/docker-jellyfin/
rm -rf $workdir/docker-filebrowser/README.md ; cp $workdir/README.md $workdir/docker-filebrowser/
rm -rf $workdir/docker-ariang/README.md ; cp $workdir/README.md $workdir/docker-ariang/