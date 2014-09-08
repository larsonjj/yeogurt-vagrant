Vagrant Setup for Yeogurt Generator
===============

Setup up Yeogurt generator quick and easy using Vagrant

# Installation

## Vagrant
Go to the [Vagrant](https://docs.vagrantup.com/v2/installation/index.html) website and install the software

## Install Ubuntu box
Once you have vagrant installed, run the following command:

```
vagrant box add ubuntu/trusty64
```

This will install a box that is a clean version of Ubuntu 14.04 x64

## Setup configuration
All the needed configuration needed can be obtained by cloning this repository:

```
git clone git@github.com:larsonjj/yeogurt-vagrant.git ./desired/folder
```

# Usage

Once you have the needed Ubuntu box and the Vagrant file located in your desired folder, you can run:

```
vagrant up
```

Then you should have everything up and running in a new Virtual Machine with all the needed software.
