# Docker file 

This project is to help you deploy your nodejs server with docker container.

## find existing images
docker images

## remove old images
docker rmi {image id}

## build new images
docker build -t server {path to this folder}

## start server
docker run -p 3000:3000 -v /var/mongodb:/data/db --name server server

## restart server
docker (re)start server

