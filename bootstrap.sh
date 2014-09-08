#!/usr/bin/env bash

# Update apt-get to get 10gen stable packages
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Update dependencies
apt-get update -y

# Upgrade packages
apt-get upgrade -y

# Install cURL
apt-get install curl -y

# Install Node.js

# Create folder to house node bin file once installed
mkdir /home/vagrant/local

# Install build tools, git, and wget
apt-get install wget build-essential git -y

# Configure git to use HTTPS instead of git port (Fixes issues with corporate networks)
git config --global url."https://".insteadOf git://

# Grab Node.js v0.10.31
wget http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz

# Unzip node package
tar -xvf node-v0.10.31.tar.gz

# Navigate to node package folder
cd node-v0.10.31

# Configure build
./configure --prefix=/home/vagrant/local

# Build node.js from source and install
make install

# Setup .bashrc and node bin location
echo 'export PATH=$HOME/local/bin:$PATH' >> /home/vagrant/.bashrc
echo 'export NODE_PATH=$HOME/local/lib/node_modules' >> /home/vagrant/.bashrc

# Clean up node.js install files
rm -rf /home/vagrant/node-v0.10.31 /home/vagrant/node-v0.10.31.tar.gz

# Install specific mongodb stable version
apt-get install -y mongodb-org=2.6.1 mongodb-org-server=2.6.1 mongodb-org-shell=2.6.1 mongodb-org-mongos=2.6.1 mongodb-org-tools=2.6.1
# Pin to the exact version above, so it's not auto upgraded by apt-get
echo "mongodb-10gen hold" | dpkg --set-selections

# Install MySQL server with default username and password
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server

# Setup permissions for npm
chown -R `whoami` `npm -g bin`

# Create symbolic link for sudo user to use npm and node
sudo ln -s /home/vagrant/local/bin/node /usr/bin/node
sudo ln -s /home/vagrant/local/bin/npm /usr/bin/npm
sudo ln -s /home/vagrant/local/bin/node-waf /usr/bin/node-waf

# Allow reloading of .bashrc
chmod a+x /home/vagrant/.bashrc
PS1='$ '

# Make node available in current terminal
source /home/vagrant/.bashrc

# Install yeoman, bower, grunt, and generator-yeogurt
npm install -g yo generator-yeogurt
