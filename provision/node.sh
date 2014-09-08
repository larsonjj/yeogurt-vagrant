#!/usr/bin/env bash

# Update dependencies
apt-get update -y

# Install NVM and git

# Install build tools, git, and libssl-dev
apt-get install build-essential libssl-dev git -y

# Configure git to use HTTPS instead of git port (Fixes issues with corporate networks)
git config --global url."https://".insteadOf git://

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

# Create symbolic link for sudo user to use npm and node
sudo ln -s /home/vagrant/local/bin/node /usr/bin/node
sudo ln -s /home/vagrant/local/bin/npm /usr/bin/npm
sudo ln -s /home/vagrant/local/bin/node-waf /usr/bin/node-waf
