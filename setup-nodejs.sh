#!/bin/bash

echo "Installing Nodejs"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs build-essential

echo "Installing PM2"
npm install -g pm2

echo "Installing gulp"
npm install -g gulp

echo "Installing bower"
npm install -g bower