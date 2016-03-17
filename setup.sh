#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing language pack"
apt-get install language-pack-en -y > /dev/null
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

echo "Installing Nginx"
apt-get install nginx -y > /dev/null

echo "Preparing MySQL"
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpwd"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpwd"

echo "Installing MySQL"
apt-get install mysql-server-5.6 mysql-client-5.6 -y > /dev/null

echo "Installing Composer"
wget 'https://getcomposer.org/composer.phar' > /dev/null
chmod 755 composer.phar
mv composer.phar /usr/local/bin/composer