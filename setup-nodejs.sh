#!/bin/bash

echo "Installing MongoDB"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update > /dev/null
apt-get install -y mongodb-org=3.2.6 mongodb-org-server=3.2.6 mongodb-org-shell=3.2.6 mongodb-org-mongos=3.2.6 mongodb-org-tools=3.2.6 > /dev/null

echo "Installing Nodejs"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs build-essential > /dev/null

echo "Installing PM2"
npm install -g pm2 > /dev/null

echo "Installing gulp"
npm install -g gulp > /dev/null

echo "Installing bower"
npm install -g bower > /dev/null