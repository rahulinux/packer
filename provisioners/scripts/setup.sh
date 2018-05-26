#!/bin/bash

# Install packages
yum install ansible git -y

date | sudo tee /etc/build_time

/sbin/mkhomedir_helper vagrant

cd /home/vagrant
mkdir .ssh
curl -fsSLo .ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0700 .ssh
chmod 0600 .ssh/authorized_keys
chown -R vagrant. /home/vagrant
