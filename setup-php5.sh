#!/bin/bash

echo "Configuring Nginx"
cp /var/www/nginx_vhost_php5 /etc/nginx/sites-available/vhosts
ln -s /etc/nginx/sites-available/vhosts /etc/nginx/sites-enabled/vhosts
rm -rf /etc/nginx/sites-enabled/default
service nginx restart

echo "Updating PHP 5.6 repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php5-5.6 -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP 5.6"
apt-get install php5-common php5-cli php5-fpm -y > /dev/null

echo "Installing PHP 5.6 extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-intl -y > /dev/null