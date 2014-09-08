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

This will run the `bootstrap.sh` file and install all the needed dependencies:

- MongoDB 2.6.1
- Ruby 2.1.2 (Not needed, but good to have)
- MySQL Server 5.5.5
- Node.js 0.10.31
- Yeoman, Grunt, Bower npm packages
- [Yeogurt Generator](https://github.com/larsonjj/generator-yeogurt#bower-not-installing-dependencies-using-git)

***Note: Installation make take a while to complete as Node is being built from source (~5-15mins)***

Once the script completes, the VM should boot up and you should have everything you need to start working with Yeogurt.
