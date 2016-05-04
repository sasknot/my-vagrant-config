# -*- mode: ruby -*-
# vi: set ft=ruby :

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

  # fix stdin: is not a tty
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # default provision
  config.vm.provision "shell" do |s|
    s.path = "setup.sh"
  end

  # nodejs machine
  config.vm.define "nodejs" do |nodejs|
    # remote access
    nodejs.vm.network "private_network", ip: "33.33.33.10"

    # apps ports
    for i in 7000..7100
      nodejs.vm.network "forwarded_port", guest: i, host: i
    end

    # machine provision
    nodejs.vm.provision "shell" do |s|
      s.path = "setup-nodejs.sh"
    end
  end

  # php5 machine
  config.vm.define "php5" do |php5|
    # remote access
    php5.vm.network "private_network", ip: "33.33.33.50"

    # mysql port
    php5.vm.network "forwarded_port", guest: 3306, host: 3306

    # apps ports
    for i in 8000..8100
      php5.vm.network "forwarded_port", guest: i, host: i
    end

    # machine provision
    php5.vm.provision "shell" do |s|
      s.path = "setup-php5.sh"
    end
  end

  # php7 machine
  config.vm.define "php7" do |php7|
    # remote access
    php7.vm.network "private_network", ip: "33.33.33.70"

    # mysql port
    php7.vm.network "forwarded_port", guest: 3306, host: 3306

    # apps ports
    for i in 9000..9100
      php7.vm.network "forwarded_port", guest: i, host: i
    end

    # machine provision
    php7.vm.provision "shell" do |s|
      s.path = "setup-php7.sh"
    end
  end
end
