#!/bin/bash

appInit () {
    mkdir /myapp/
    cd /myapp/
    git clone git@lab.artemisprojects.org:zilinglu/ticflow-backend.git
    cd /myapp/ticflow-backend/
    rm -rf node_modules/
    npm install
    node ./bin/initUsers.js
    node ./bin/initLists.js
}

appStart () {
    if [ ! -d /myapp/fcws/ ]; then
        appInit
    fi
    mongod --fork --logpath=/var/log/mongo.log --logappend
    cd /myapp/ticflow-backend/ && git pull origin master
    rm -rf node_modules/
    npm install
    nodemon ./bin/www
}

case ${1} in
  app:start)
    appStart
    ;;
  app:init)
    appInit
    ;;
esac

exit 0
