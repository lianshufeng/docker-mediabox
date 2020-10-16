# Docker-MediaBox
AriaNg + FileBrowser + Samba + jellyfin

### run docker
- down script
````shell
git clone https://github.com/lianshufeng/docker-mediabox.git
cd docker-mediabox
````


### docker-compose
- amd64 / pc
````shell
source .env
docker-compose -f docker-compose-amd64.yml up -d
````

- arm / raspberrypi 
````shell
source .env
docker-compose -f docker-compose-arm.yml up -d
````
- source 
````shell
docker-compose up -d
````

### configure
- update .env file
````shell
# user data 
store=/opt/store/fs

# application data 
filebrowser_store=/opt/store/filebrowser
ariang_store=/opt/store/ariang
nginx_store=/opt/store/nginx
jellyfin_store=/opt/store/jellyfin
````


