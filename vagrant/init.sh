#!/bin/bash

MOODLE_VERSION="v3.1.4"

if [ ! -f vagrant/init.sh ]; then
    echo "Please run this script from the Django diectory."
    return 1
fi

cd ..

if [ ! -d moodle ]; then
    echo "Cloning Moodle ..."
    git clone https://github.com/moodle/moodle moodle
    cd moodle
    git config core.filemode false
    git checkout -b local $MOODLE_VERSION
    cd ..
    echo "Done."
fi

cd moodle
DES=`git describe`
if [ $DES != "$MOODLE_VERSION" ]; then
    echo "Wrong version of Moodle! Please checkout $MOODLE_VERSION."
fi
cd ..

if [ ! -d moodledata ]; then
    mkdir moodledata
fi

if [ ! -d phpu_moodledata ]; then
    mkdir phpu_moodledata
fi

cd django
echo "Vagrant directories initialized."
echo "You may now run 'vagrant up' or 'vagrant up --provision'."
return 0
