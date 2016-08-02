# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "en_US.UTF-8"
Vagrant.require_version ">= 1.8.1"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # memory increase
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  # synced folder
  config.vm.synced_folder "./apps", "/var/www", create: true, group: "www-data", owner: "www-data"

  # default provision
  config.vm.provision "shell" do |s|
    s.path = "setup.sh"
  end

  # nodejs machine
  # configures: remote access, mysql port, apps ports and provisioning
  config.vm.define "nodejs" do |nodejs|
    nodejs.vm.network "private_network", ip: "33.33.33.10"
    nodejs.vm.network "forwarded_port", guest: 3306, host: 3306

    for i in 7000..7050
      nodejs.vm.network "forwarded_port", guest: i, host: i
    end

    nodejs.vm.provision "shell" do |s|
      s.path = "setup-nodejs.sh"
    end
  end

  # php5 machine
  # configures: remote access, mysql port, apps ports and provisioning
  config.vm.define "php5" do |php5|
    # remote access
    php5.vm.network "private_network", ip: "33.33.33.20"
    php5.vm.network "forwarded_port", guest: 3306, host: 3306

    for i in 8000..8050
      php5.vm.network "forwarded_port", guest: i, host: i
    end

    php5.vm.provision "shell" do |s|
      s.path = "setup-php5.sh"
    end
  end

  # php7 machine
  # configures: remote access, mysql port, apps ports and provisioning
  config.vm.define "php7" do |php7|
    php7.vm.network "private_network", ip: "33.33.33.30"
    php7.vm.network "forwarded_port", guest: 3306, host: 3306

    for i in 9000..9050
      php7.vm.network "forwarded_port", guest: i, host: i
    end

    php7.vm.provision "shell" do |s|
      s.path = "setup-php7.sh"
    end
  end
end
