#!/bin/bash

#获取当前执行的脚本文件的父目录
workdir=$(cd $(dirname $0); pwd)

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

	#设置阿里云的源
	sed -i "/FROM alpine/a\RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories" $workdir/$4/Dockerfile
	
	echo "finish -> "$4
}


# samba
UpdateProject "https://github.com/dperson/samba/archive/master.zip" "samba-master"  "." "docker-samba"

# minidlna
UpdateProject "https://github.com/vladgh/docker_base_images/archive/master.zip" "docker_base_images-master" "minidlna" "docker-minidlna"
