# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# INTO github plugins
#
# To start the guest (i.e. the Vagrant box) run the following:
# "vagrant up" (on the host, to start the guest)
# "vagrant ssh" (on the host, to ssh into the guest)
# "runserver" (on the guest, to run the Django development server)
#
# Django is on http://10.0.0.10:8000
# Moodle is on http://10.0.0.10
#

Vagrant.configure("2") do |config|
    config.vm.define "INTO github plugins" do |foo|
    end

    # base box
    config.vm.box = "ubuntu/trusty64"

    # virtualbox
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end

    # synced folders
    config.vm.synced_folder "../moodle/", "/vagrant/moodle",
        owner: "vagrant",
        group: "www-data",
        mount_options: ["dmode=775,fmode=764"]
    config.vm.synced_folder "../moodledata/", "/vagrant/moodledata",
        owner: "vagrant",
        group: "www-data",
        mount_options: ["dmode=775,fmode=764"]
    config.vm.synced_folder "../phpu_moodledata/", "/vagrant/phpu_moodledata",
        owner: "vagrant",
        group: "www-data",
        mount_options: ["dmode=775,fmode=764"]

    # static IP
    config.vm.network "private_network", ip: "10.0.0.10"

    # provisioned files
    config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
    config.vm.provision "file", source: "vagrant/bash_aliases", destination: ".bash_aliases"
    config.vm.provision "file", source: "vagrant/exrc", destination: ".exrc"
    config.vm.provision "file", source: "vagrant/inputrc", destination: ".inputrc"
    config.vm.provision "file", source: "vagrant/pgpass", destination: ".pgpass"
    config.vm.provision "file", source: "vagrant/000-default.conf", destination: "000-default.conf"
    config.vm.provision "file", source: "vagrant/vagrant_settings.py", destination: "settings.py"
    config.vm.provision "file", source: "vagrant/vagrant_config.php", destination: "config.php"
    config.vm.provision "file", source: "vagrant/phpunit_plugins.xml", destination: "phpunit_plugins.xml"
    config.vm.provision "file", source: "vagrant/composer.json", destination: "composer.json"

    # provisioning scripts
    config.vm.provision "shell", path: "vagrant/provision_as_root.sh"
    config.vm.provision "shell", path: "vagrant/provision_as_vagrant.sh", privileged: false
    config.vm.provision "shell", path: "vagrant/provision_databases.sh"
end
