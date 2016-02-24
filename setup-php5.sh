#!/bin/bash

echo "Updating PHP 5 repository"
apt-get install python-software-properties build-essential -y
add-apt-repository ppa:ondrej/php5 -y
apt-get update

echo "Installing PHP 5"
apt-get install php5-common php5-dev php5-cli php5-fpm -y

echo "Installing PHP 5 extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-intl -y