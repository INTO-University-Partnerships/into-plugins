#!/bin/bash

# PostgreSQL
PGSQL_DB_PASSWORD="W0mb4t666!"

# Restore Django PostgreSQL database
SHOW=`sudo -u postgres psql -c "\list" | grep -P '^\s*plugins_django\s*\|' | grep -o plugins_django`
if [ "$SHOW" != "plugins_django" ]; then
    echo "PostgreSQL Django database does not exist, creating ..."
    sudo -u postgres psql -c "create database plugins_django"
    echo "Done."
    echo "Restoring Django database ..."
    sudo -u postgres psql plugins_django < /vagrant/vagrant/django.pgsql > /dev/null 2>&1
    echo "Done."
else
    echo "PostgreSQL Django database already exists."
fi

# Restore Moodle PostgreSQL database
SHOW=`sudo -u postgres psql -c "\list" | grep -P '^\s*plugins_moodle\s*\|' | grep -o plugins_moodle`
if [ "$SHOW" != "plugins_moodle" ]; then
    echo "PostgreSQL Moodle database does not exist, creating ..."
    sudo -u postgres psql -c "create database plugins_moodle"
    echo "Done."
    echo "Restoring Moodle database ..."
    sudo -u postgres psql plugins_moodle < /vagrant/vagrant/moodle.pgsql > /dev/null 2>&1
    echo "Done."
else
    echo "PostgreSQL Moodle database already exists."
fi

# MySQL
MYSQL_DB_PASSWORD="W0mb4t666!"

# Restore Django MySQL database
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep -P '^plugins_django$'`
if [ "$SHOW" != "plugins_django" ]; then
    echo "MySQL Django database does not exist, creating ..."
    echo "create database plugins_django" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
    echo "Done."
    echo "Restoring Django database ..."
    mysql -uroot -p"$MYSQL_DB_PASSWORD" plugins_django < /vagrant/vagrant/django.mysql
    echo "Done."
else
    echo "MySQL Django database already exists."
fi

# Restore Moodle MySQL database
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep -P '^plugins_moodle$'`
if [ "$SHOW" != "plugins_moodle" ]; then
    echo "MySQL Moodle database does not exist, creating ..."
    echo "create database plugins_moodle" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
    echo "Done."
    echo "Restoring Moodle database ..."
    mysql -uroot -p"$MYSQL_DB_PASSWORD" plugins_moodle < /vagrant/vagrant/moodle.mysql
    echo "Done."
else
    echo "MySQL Moodle database already exists."
fi

# migrate databases
/home/vagrant/.virtualenvs/plugins_py2/bin/python2.7 /vagrant/manage.py migrate
cd /vagrant/moodle
php admin/cli/upgrade.php --non-interactive
