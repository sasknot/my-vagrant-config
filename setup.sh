#!/bin/bash

echo "Provisioning virtual machine..."
apt-get update >/dev/null

echo "Installing language"
apt-get install language-pack-en -y >/dev/null
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8