
#多阶段构建命令
FROM busybox as builder


#依赖的版本
FROM filebrowser/filebrowser:v2.15.0

#拷贝 sh 等命令
COPY --from=builder /bin /bin

#备份配置库文件
RUN mkdir -p /tmp/backup
COPY .filebrowser.json /.filebrowser.json

#拷贝启动命令
COPY entrypoint.sh /entrypoint.sh
RUN chmod -R 777 /entrypoint.sh
RUN chmod -R 777 /filebrowser

# 启动任务
ENTRYPOINT [ "/entrypoint.sh" ]