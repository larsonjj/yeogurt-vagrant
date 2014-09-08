#!/usr/bin/env bash

# Update apt-get to get 10gen stable packages
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Update dependencies
apt-get update -y

# Install specific mongodb stable version
apt-get install -y mongodb-org=2.6.1 mongodb-org-server=2.6.1 mongodb-org-shell=2.6.1 mongodb-org-mongos=2.6.1 mongodb-org-tools=2.6.1
# Pin to the exact version above, so it's not auto upgraded by apt-get
echo "mongodb-10gen hold" | dpkg --set-selections
