#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing Nginx"
apt-get install nginx -y > /dev/null

echo "Configuring Nginx"
cp /var/www/nginx_vhost /etc/nginx/sites-available/nginx_vhost
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/nginx_vhost
rm -rf /etc/nginx/sites-enabled/default
service nginx restart

echo "Preparing MySQL"
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpwd"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpwd"

echo "Installing MySQL"
apt-get install mysql-server -y > /dev/null

# echo "Configuring MySQL"
# mysql -u root -prootpwd

# use mysql
# GRANT ALL ON *.* to root@'33.33.33.10';
# FLUSH PRIVILEGES;
# exit