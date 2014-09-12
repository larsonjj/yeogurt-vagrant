#!/usr/bin/env bash

# Update dependencies
apt-get update -y

# Install NVM and git

# Install build tools, git, and libssl-dev
apt-get install build-essential libssl-dev git -y

# Configure git to use HTTPS instead of git port (Fixes issues with corporate networks)
git config --global url."https://".insteadOf git://

# Install Node.js

# Install git
apt-get install git -y

# Configure git to use HTTPS instead of git port (Fixes issues with corporate networks)
git config --global url."https://".insteadOf git://

# Download 'n' node version manager
curl -#L https://github.com/visionmedia/n/archive/v1.2.7.tar.gz | tar -xzv

# Go into downloaded directory and install 'n'
cd n-1.2.7 && sudo make install

# Install Node
n 0.10.31

# Cleanup
cd .. && rm -rf n-1.2.7/
