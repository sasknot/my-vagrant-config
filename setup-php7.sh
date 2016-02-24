#!/bin/bash

echo "Updating PHP 7 repository"
apt-get install python-software-properties build-essential -y
add-apt-repository ppa:ondrej/php -y
apt-get update

echo "Installing PHP 7"
apt-get install php7-common php7-dev php7-cli php7-fpm -y

echo "Installing PHP 7 extensions"
apt-get install curl php7-curl php7-gd php7-mcrypt php7-mysql php7-intl -y