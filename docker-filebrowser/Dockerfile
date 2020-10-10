
#多阶段构建命令
FROM busybox as builder


#依赖的版本
FROM filebrowser/filebrowser:v2.8.0  

#拷贝 sh 等命令
COPY --from=builder /bin /bin

#备份配置库文件
RUN mkdir -p /tmp/backup
COPY .filebrowser.json /.filebrowser.json
COPY database.db /tmp/backup/database.db

#拷贝启动命令
COPY entrypoint.sh /entrypoint.sh
RUN chmod -R 777 /entrypoint.sh

# 启动任务
ENTRYPOINT [ "/entrypoint.sh" ]