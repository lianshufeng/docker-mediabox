# Docker-MediaBox
AriaNg + FileBrowser + Samba + jellyfin

### Run Docker
- download script
````shell
git clone https://github.com/lianshufeng/docker-mediabox.git
cd docker-mediabox
````

### How Use
- shell
````
# Samba
\\ip\share


# all web server on port 80 

# Jellyfin 
http://ip
# FileBrowser (user/password : admin/admin)
http://ip/files
# AriaNg 
http://ip/dl

````



### Docker-Compose
- Amd64 / pc
````shell
source .env
docker-compose -f docker-compose-amd64.yml up -d
````

- Arm / Raspberrypi 
````shell
source .env
docker-compose -f docker-compose-arm.yml up -d
````
- Source 
````shell
docker-compose up -d
````

### Configure
- update .env file
````shell
# User Data 
store=/opt/store/fs

# Application data 
filebrowser_store=/opt/store/filebrowser
ariang_store=/opt/store/ariang
nginx_store=/opt/store/nginx
jellyfin_store=/opt/store/jellyfin
````


