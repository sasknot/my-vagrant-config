# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # For mysql
  config.vm.network "private_network", ip: "33.33.33.10"
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  config.vm.synced_folder "./apps", "/var/www", create: true, group: "www-data", owner: "www-data"

  config.vm.provision "shell" do |s|
    s.path = "setup.sh"
  end

  config.vm.define "php5" do |php5|
    php5.vm.network "forwarded_port", guest: 8000, host: 8000
    php5.vm.provision "shell" do |s|
      s.path = "setup-php5.sh"
    end
  end

  config.vm.define "php7" do |php7|
    php7.vm.network "forwarded_port", guest: 80, host: 9000
    php7.vm.provision "shell" do |s|
      s.path = "setup-php7.sh"
    end
  end
end
