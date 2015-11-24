#!/bin/bash

# Install ssh
# yum install openssh-server nano wget gcc bzip2 make kernel-devel-`uname -r` -y

useradd vagrant
groupadd admin
usermod -G admin vagrant
echo 'vagrant:vagrant' | chpasswd

cat <<_EOF > /etc/sudoers.d/vagrant
Defaults:vagrant !requiretty
%admin ALL=NOPASSWD: ALL
_EOF

/sbin/mkhomedir_helper vagrant
cd /home/vagrant
mkdir .ssh
#wget --no-check-certificate https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O .ssh/authorized_keys
mv /tmp/ssh_key .ssh/authorized_keys
chmod 0700 .ssh
chmod 0600 .ssh/authorized_keys
chown -R vagrant. /home/vagrant
