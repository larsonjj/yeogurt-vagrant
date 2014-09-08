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
Get all the needed configuration (using cURL)

```
curl -#L https://github.com/larsonjj/yeogurt-vagrant/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,.gitignore,LICENSE}
```

***Note: This will download all the files in the repository and put them within the current folder.***

# Usage

Once you have the needed Ubuntu box and all of the configuration files located in your desired folder, you can run:

```
vagrant up
```

This will run all of the scripts in the `provision` folder and install all the needed dependencies:

- MongoDB 2.6.1
- Ruby 2.1.2 (Not needed, but good to have)
- MySQL Server 5.5.5
- Node.js 0.10.31
- Yeoman, Grunt, Bower npm packages
- [Yeogurt Generator](https://github.com/larsonjj/generator-yeogurt#bower-not-installing-dependencies-using-git)

***Note: Installation make take a while to complete as Node is being built from source (~5-15mins)***

Once the script completes, you can boot up the VM with `vagrant ssh`. Find more info on [Vagrant's site](https://docs.vagrantup.com/v2/getting-started/index.html).

Congrats! You should have everything you need to start working with Yeogurt.
