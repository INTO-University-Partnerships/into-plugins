#!/bin/bash

MYSQL_DB_PASSWORD="W0mb4t666!"

# Restore MySQL databases
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep -P '^plugins_django$'`
if [ "$SHOW" != "plugins_django" ]; then
    echo "create database plugins_django" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
    mysql -uroot -p"$MYSQL_DB_PASSWORD" plugins_django < /home/vagrant/django.sql
fi
rm /home/vagrant/django.sql
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep -P '^plugins_moodle$'`
if [ "$SHOW" != "plugins_moodle" ]; then
    echo "create database plugins_moodle" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
    mysql -uroot -p"$MYSQL_DB_PASSWORD" plugins_moodle < /home/vagrant/moodle.sql
fi
rm /home/vagrant/moodle.sql
