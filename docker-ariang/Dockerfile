FROM alpine:3

ENV AriaNgVersion 1.2.5

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


#修改 ariang 请求RPC的请求地址，需要配合nginx使用
RUN find /aria-ng/js/ -name aria-ng*.js -exec sed -i 's/getCurrentRpcUrl:function()/getCurrentRpcUrl:function()\{return ".\/jsonrpc"; \},test_backup:function()/g' {} \;


EXPOSE 6800 80 8080


RUN chmod -R 777 /aria2/init.sh
ENTRYPOINT sh /aria2/init.sh