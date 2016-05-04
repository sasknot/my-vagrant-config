#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing language pack"
apt-get install language-pack-en -y > /dev/null
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

echo "Installing git"
apt-get install git-all -y > /dev/null