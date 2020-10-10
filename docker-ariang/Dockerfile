FROM alpine:latest

ENV AriaNgVersion 1.1.7

#切换阿里的源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng \
	&& wget --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/${AriaNgVersion}/AriaNg-${AriaNgVersion}.zip \
	&& unzip AriaNg-${AriaNgVersion}.zip -d aria-ng \
	&& rm -rf AriaNg-${AriaNgVersion}.zip

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

RUN chmod 777 /aria2/init.sh

WORKDIR /

VOLUME ["/aria2/conf", "/aria2/downloads"]


EXPOSE 6800 80 8080



ENTRYPOINT sh /aria2/init.sh