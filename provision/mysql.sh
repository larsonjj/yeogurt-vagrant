#!/usr/bin/env bash

# Update dependencies
apt-get update -y

# Install MySQL server with default username and password
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
