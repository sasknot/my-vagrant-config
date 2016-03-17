#!/bin/bash

echo "Configuring Nginx"
cp /var/www/nginx_vhost_php7 /etc/nginx/sites-available/vhosts
ln -s /etc/nginx/sites-available/vhosts /etc/nginx/sites-enabled/vhosts
rm -rf /etc/nginx/sites-enabled/default
service nginx restart

echo "Updating PHP 7.0 repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP 7.0"
apt-get install php7.0-common php7.0-cli php7.0-fpm -y > /dev/null

echo "Installing PHP 7.0 extensions"
apt-get install curl php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-intl -y > /dev/null