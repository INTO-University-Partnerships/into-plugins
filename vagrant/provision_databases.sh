#!/bin/bash

MYSQL_DB_PASSWORD="W0mb4t666!"

# Create (empty) MySQL databases
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep plugins_django`
if [ "$SHOW" != "plugins_django" ]; then
    echo "create database plugins_django" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
fi
SHOW=`echo "show databases" | mysql -uroot -p"$MYSQL_DB_PASSWORD" | grep plugins_moodle`
if [ "$SHOW" != "plugins_moodle" ]; then
    echo "create database plugins_moodle" | mysql -uroot -p"$MYSQL_DB_PASSWORD"
fi
