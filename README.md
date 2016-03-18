docker files for nodejs server with mongo db

fcws_server for app fcws, ticflow_server for app ticflow

##查看已有镜像
sudo docker images

##删除以前的镜像
sudo docker rmi {image id}

##build新镜像
sudo docker build -t server {path to this folder}

##运行镜像，开启server容器 (端口映射、磁盘映射)
sudo docker run -p 3000:3000 -v /var/mongodb:/data/db --name server server

##重启停止的server容器，并更新服务端代码
sudo docker (re)start server

##清空数据库以前的数据
sudo rm -f /var/mongodb/fcws.*
