#!/usr/bin/env bash

# Setup permissions for npm
chown -R vagrant /home/vagrant/local/bin
chown -R vagrant /home/vagrant/local/lib

echo 'Congratulations!'
echo 'Yeogurt Install Completed with 0 Errors.'
echo 'Run "vagrant ssh" to start working with Yeogurt.'