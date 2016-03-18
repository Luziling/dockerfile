FROM docker.answ.me:5001/aplusplus/ubuntu:14.04
MAINTAINER Shengwei An (njuasw#gmail.com) Ziling Lu

# 安装 Mongodb（来自官方教程）nodejs npm git
# 由于apt-get下载的Node实际上是nodejs，所以要创建一个node的快捷方式
# 创建mongodb数据文件夹
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
 && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list \
 && apt-get update \
 && apt-get install -y mongodb-org nodejs npm git python make g++ \
 && ln -s /usr/bin/nodejs /usr/bin/node \
 && npm install -g nodemon \
 && mkdir -p /data/db \
 && rm -rf /var/lib/apt/lists/*

# 配置ssh
COPY ssh/ /root/.ssh/
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 700 /root/.ssh/ \
 && chmod 600 /root/.ssh/id_rsa \
 && chmod 755 /sbin/entrypoint.sh

# 暴露端口（分别是nodejs和mongodb）
EXPOSE 3000 27017

# 设置nodejs环境变量
# ENV NODE_ENV=production PORT=3000

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["app:start"]

