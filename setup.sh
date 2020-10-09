#!/bin/bash

#进入当前目录
cd `dirname $0`

#安装工具
yum install dos2unix -y

#转换换行符
dos2unix .env
find . -name "*" -exec dos2unix {} \;
source ${PWD}/.env
