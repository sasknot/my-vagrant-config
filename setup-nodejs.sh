#!/bin/bash

echo "Installing MongoDB 3.2.6"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org=3.2.6 mongodb-org-server=3.2.6 mongodb-org-shell=3.2.6 mongodb-org-mongos=3.2.6 mongodb-org-tools=3.2.6

echo "Installing Nodejs 4.x"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs build-essential

echo "Installing PM2 (latest)"
npm install -g pm2

echo "Installing gulp (latest)"
npm install -g gulp

echo "Installing bower (latest)"
npm install -g bower