#!/bin/bash

date >> /etc/vagrant_provisioned_at

# Essentials
apt-get update -qq
apt-get install -y vim git htop

# Apache and PHP
apt-get install -y apache2
apt-get install -y php5-cli php5-common php5-curl php5-gd php5-intl php5-json php5-mysql php5-pgsql php5-readline php5-xdebug php5-xmlrpc
apt-get install -y libapache2-mod-php5
a2enmod php5
a2enmod rewrite

# add comment to end of /etc/php5/apache2/php.ini
PHPINI="/etc/php5/apache2/php.ini"
COMMENT="\n#\n# Vagrant provision script\n#\n\n"
grep -q -F "Vagrant provision script" $PHPINI || printf "$COMMENT" >> $PHPINI

# xdebug
XDEBUG="xdebug.remote_enable=on\nxdebug.remote_connect_back=on\n"
grep -q -F "xdebug.remote_enable=on" $PHPINI || printf "$XDEBUG" >> $PHPINI

# Move provisioned 000-default.conf file to the correct place
mv /home/vagrant/000-default.conf /etc/apache2/sites-available/

# Point Apache DocumentRoot at Moodle
if [ ! -L /var/www/html ]; then
    echo "Pointing Apache DocumentRoot to /vagrant/moodle ..."
    rm -rf /var/www/html
    ln -fs /vagrant/moodle /var/www/html
    echo "Done."
else
    echo "Apache DocumentRoot already points to /vagrant/moodle"
fi

# composer.json and phpunit_plugins.xml
mv /home/vagrant/composer.json /vagrant/moodle/
mv /home/vagrant/phpunit_plugins.xml /vagrant/moodle/
rm /vagrant/moodle/composer.lock

# Comment-out a line in lib/phpunit/bootstrap.php
sed -i 's/\$CFG->wwwroot   = '\''http:\/\/www\.example\.com\/moodle'\'';/# line removed to prevent web tests breaking/' /vagrant/moodle/lib/phpunit/bootstrap.php

# Composer
export COMPOSER_DISABLE_XDEBUG_WARN='1'
cd /vagrant/moodle
if [ ! -f composer.phar ]; then
    echo "Installing Composer and its packages ..."
    curl -sS https://getcomposer.org/installer | php
    ./composer.phar install -q
else
    echo "Composer.phar is already installed, updating itself and its packages ..."
    ./composer.phar self-update
    ./composer.phar update -q
fi
cd ~
echo "Done."

# MySQL server
MYSQL_DB_PASSWORD="W0mb4t666!"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_DB_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_DB_PASSWORD"
apt-get install -y mysql-server

# add comment to end of /etc/mysql/my.cnf
MYCNF="/etc/mysql/my.cnf"
COMMENT="\n#\n# Vagrant provision script\n#\n\n"
grep -q -F "Vagrant provision script" $MYCNF || printf "$COMMENT" >> $MYCNF

# my.cnf
UTF8="[mysqld]\ncollation-server = utf8_unicode_ci\ninit-connect='SET NAMES utf8'\ncharacter-set-server = utf8\n"
grep -q -F "collation-server = utf8_unicode_ci" $MYCNF || printf "$UTF8" >> $MYCNF

# PostgreSQL server
PGSQL_DB_PASSWORD="W0mb4t666!"
apt-get install -y postgresql
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '$PGSQL_DB_PASSWORD';"

# Python
apt-get install -y python-pip python-dev python3-dev postgresql-server-dev-9.3 libmysqlclient-dev libffi-dev libjpeg-dev
pip install -q virtualenv virtualenvwrapper

# Restart services
service apache2 restart
service mysql restart
service postgresql restart
