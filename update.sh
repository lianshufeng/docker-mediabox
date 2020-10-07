#!/bin/bash


# update project function
UpdateProject(){
	echo "url : "$1
	echo "fileName : "$2
	echo "projectName : "$3
	
	
	rm -rf $3
	mkdir $3
	cd $3
	wget $1 -O master.zip
	unzip master.zip
	rm -rf master.zip
	mv -f $2/* ./
	rm -rf $2
	cd ..
	echo "finish -> "$3
}


# samba
UpdateProject "https://github.com/dperson/samba/archive/master.zip" "samba-master" "docker-samba"

# minidlna
UpdateProject "https://github.com/vladgh/docker_base_images/archive/master.zip" "docker_base_images-master" "docker-minidlna"
cd docker-minidlna
find . -maxdepth 1 ! -name minidlna -exec rm -rf {} \;
cd ..