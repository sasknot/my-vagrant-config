#!/bin/bash

echo "Preparing MySQL"
apt-get install debconf-utils -y >/dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpwd"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpwd"

echo "Installing MySQL 5.6"
apt-get install mysql-server-5.6 mysql-client-5.6 -y >/dev/null


echo "Installing Nginx (latest)"
apt-get install nginx -y >/dev/null

echo "Configuring Nginx"
cat > /etc/nginx/sites-available/vhosts <<'EOL'
server {
  listen 80;
  server_name localhost;

  root /var/www/;
  index index.php index.html;

  # Important for VirtualBox
  sendfile off;

  location / {
    try_files $uri $uri/ =404;
  }

  location ~* \.php {
    include fastcgi_params;

    fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_index index.php;
    fastcgi_cache off;
  }
}

include /var/www/**/.nginx-php7.conf;
EOL
ln -s /etc/nginx/sites-available/vhosts /etc/nginx/sites-enabled/vhosts
rm -rf /etc/nginx/sites-enabled/default
service nginx restart


echo "Updating PHP 7.0 repository"
apt-get install python-software-properties build-essential -y >/dev/null
add-apt-repository ppa:ondrej/php -y >/dev/null
apt-get update >/dev/null

echo "Installing PHP 7.0"
apt-get install php7.0-common php7.0-cli php7.0-fpm -y >/dev/null

echo "Installing curl"
apt-get install curl -y >/dev/null

echo "Installing PHP 7.0 extensions"
apt-get install php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-intl php7.0-mbstring php7.0-zip -y >/dev/null


echo "Installing Composer (latest)"
COMPOSER_EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
COMPOSER_ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$COMPOSER_EXPECTED_SIGNATURE" = "$COMPOSER_ACTUAL_SIGNATURE" ]
then
    php composer-setup.php --quiet
    RESULT=$?
    rm composer-setup.php
    exit $RESULT
else
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

mv composer.phar /usr/local/bin/composer
