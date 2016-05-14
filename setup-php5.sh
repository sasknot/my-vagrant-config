#!/bin/bash

echo "Preparing MySQL"
apt-get install debconf-utils -y
debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpwd"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpwd"

echo "Installing MySQL"
apt-get install mysql-server-5.6 mysql-client-5.6 -y

echo "Installing Nginx"
apt-get install nginx -y

echo "Installing Composer"
wget 'https://getcomposer.org/composer.phar'
chmod 755 composer.phar
mv composer.phar /usr/local/bin/composer

echo "Configuring Nginx"
cp /var/www/nginx_vhost_php5 /etc/nginx/sites-available/vhosts
ln -s /etc/nginx/sites-available/vhosts /etc/nginx/sites-enabled/vhosts
rm -rf /etc/nginx/sites-enabled/default
service nginx restart

echo "Updating PHP 5.6 repository"
apt-get install python-software-properties build-essential -y
add-apt-repository ppa:ondrej/php5-5.6 -y
apt-get update

echo "Installing PHP 5.6"
apt-get install php5-common php5-cli php5-fpm -y

echo "Installing PHP 5.6 extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-intl -y