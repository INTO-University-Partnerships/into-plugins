#!/bin/bash

# add comments to end of .profile and .bashrc
PROFILE="/home/vagrant/.profile"
BASHRC="/home/vagrant/.bashrc"
COMMENT="\n#\n# Vagrant provision script\n#\n\n"
grep -q -F "Vagrant provision script" $PROFILE || printf "$COMMENT" >> $PROFILE
grep -q -F "Vagrant provision script" $BASHRC || printf "$COMMENT" >> $BASHRC

# .profile
CMD="export PYTHONDONTWRITEBYTECODE='1'"
grep -q -F "$CMD" $PROFILE || echo "$CMD" >> $PROFILE
CMD="export COMPOSER_DISABLE_XDEBUG_WARN='1'"
grep -q -F "$CMD" $PROFILE || echo "$CMD" >> $PROFILE

# .bashrc
sed -i 's/#force_color_prompt/force_color_prompt/' .bashrc
CMD="source /usr/local/bin/virtualenvwrapper.sh"
$CMD
grep -q -F "$CMD" $BASHRC || echo "$CMD" >> $BASHRC

# Py2 virtualenv
cd /vagrant
if [ ! -d /home/vagrant/.virtualenvs/plugins_py2 ]; then
    echo "Python 2 virtualenv does not exist, creating ..."
    mkvirtualenv plugins_py2
    pip install -q pip==7.1.2
    pip install -q pip-tools
    setvirtualenvproject
else
    echo "Python 2 virtualenv already exists, updating ..."
    workon plugins_py2
fi
pip-sync
pip install -q -r requirements/local.in
deactivate
cd ~
echo "Done."

# Py3 virtualenv
cd /vagrant
if [ ! -d /home/vagrant/.virtualenvs/plugins_py3 ]; then
    echo "Python 3 virtualenv does not exist, creating ..."
    mkvirtualenv --python=$(which python3) plugins_py3
    pip install -q pip==7.1.2
    pip install -q pip-tools
    setvirtualenvproject
else
    echo "Python 3 virtualenv already exists, updating ..."
    workon plugins_py3
fi
pip-sync
pip install -q -r requirements/local.in
deactivate
cd ~
echo "Done."

# nvm
if [ ! -d /home/vagrant/.nvm ]; then
    echo "Installing Node ..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
    CMD="source /home/vagrant/.nvm/nvm.sh"
    grep -q -F "$CMD" $PROFILE || echo "$CMD" >> $PROFILE
    source $PROFILE
    nvm install 4.1.1 > /dev/null 2>&1
    nvm alias default 4.1.1
    npm install -g bower npm-check-updates gulp@3.9.0 eslint@1.10.3 eslint-plugin-react@3.15.0
else
    echo "Node is already installed."
fi
echo "Done."

# .pgpass
if [ -f /home/vagrant/.pgpass ]; then
    chmod 600 /home/vagrant/.pgpass
fi

# settings.py and config.php
if [ ! -f /vagrant/plugins/settings.py ]; then
    mv /home/vagrant/settings.py /vagrant/plugins/
else
    rm /home/vagrant/settings.py
fi
if [ ! -f /vagrant/moodle/config.php ]; then
    mv /home/vagrant/config.php /vagrant/moodle/
else
    rm /home/vagrant/config.php
fi