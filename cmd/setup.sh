#!/bin/bash

#进入当前目录
workdir=$(cd $(dirname $0); pwd)/../
cd $workdir

#安装工具
yum install dos2unix -y

#转换换行符
dos2unix .env
find . -name "*" -exec dos2unix {} \;
source ${PWD}/.env

#设置权限，否则构建会导致没有权限访问脚本
chmod -R 777 ./