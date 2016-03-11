#!/bin/bash

echo "Updating PHP 7.0 repository"
apt-get install python-software-properties build-essential -y
add-apt-repository ppa:ondrej/php -y
apt-get update

echo "Installing PHP 7.0"
apt-get install php7.0-common php7.0-cli php7.0-fpm -y

echo "Installing PHP 7.0 extensions"
apt-get install curl php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-intl -y