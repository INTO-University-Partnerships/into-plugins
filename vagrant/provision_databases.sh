#!/bin/bash

MYSQL_DB_PASSWORD="W0mb4t666!"

# Restore Django MySQL database
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep -P '^plugins_django$'`
if [ "$SHOW" != "plugins_django" ]; then
    echo "Django database does not exist, creating ..."
    echo "create database plugins_django" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
    echo "Done."
    echo "Restoring Django database ..."
    mysql -uroot -p"$MYSQL_DB_PASSWORD" plugins_django < /home/vagrant/django.sql
    echo "Done."
else
    echo "Django database already exists."
fi
rm /home/vagrant/django.sql

# Restore Moodle MySQL database
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep -P '^plugins_moodle$'`
if [ "$SHOW" != "plugins_moodle" ]; then
    echo "Moodle database does not exist, creating ..."
    echo "create database plugins_moodle" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
    echo "Done."
    echo "Restoring Moodle database ..."
    mysql -uroot -p"$MYSQL_DB_PASSWORD" plugins_moodle < /home/vagrant/moodle.sql
    echo "Done."
else
    echo "Moodle database already exists."
fi
rm /home/vagrant/moodle.sql
