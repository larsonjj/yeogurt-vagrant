#!/usr/bin/env bash

# Update dependencies
apt-get update -y

# Install yeoman, bower, grunt, and generator-yeogurt
npm install -g yo generator-yeogurt

# Setup permissions for .npm/
chown -R vagrant /home/vagrant/.npm