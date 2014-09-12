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
Create a new project folder

```
mkdir ~/new-project && cd ~/new-project
```

Get all the needed configuration (using cURL)

```
curl -#L https://github.com/larsonjj/yeogurt-vagrant/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,.gitignore,LICENSE}
```

***Note: This will download all the files in the repository and put them within the current folder.***

# Usage

## Booting up and installing dependencies
Once you have the needed Ubuntu box and all of the configuration files located in your desired folder, you can run:

```
vagrant up
```

This will boot up the VM and run all of the scripts in the `provision` folder. This will install all the needed dependencies:

- MongoDB 2.6.1
- MySQL Server 5.5.5
- Node.js 0.10.31
- Yeoman, Grunt, Bower npm packages
- [Yeogurt Generator](https://github.com/larsonjj/generator-yeogurt#bower-not-installing-dependencies-using-git)

Once the script completes, you can boot up the VM with `vagrant ssh`. Find more info on [Vagrant's site](https://docs.vagrantup.com/v2/getting-started/index.html).

Congrats! You should have everything you need to start working with Yeogurt.

## Starting a new Yeogurt Project
To start a new Yeogurt project, navigate to the `/vagrant` folder:

```
cd /vagrant`
```

Then run the Yeogurt generator:

```
yo yeogurt
```

> IMPORTANT: By default, Vagrant shares your project directory (remember, that is the one with the `Vagrantfile` and `provision` files you downloaded), which means all the files located in `/vagrant` are actually your current project files. Read more about it on Vagrant's site regarding [Synced Folders](https://docs.vagrantup.com/v2/getting-started/synced_folders.html)

# Caveats
Yeogurt should work pretty much the same within the Vagrant VM as it would being loaded on your machine. The only hinderence is that performance will be a bit slower, so you will see a bit slower compile times and installation of other software/packages.

# Increasing performance
You can increase performance of you Vagrant VM by opening up your Vagrantfile and editing these lines:

```
vb.memory = 1024 # set RAM to 1024mb
vb.cpus = 2      # set CPU cores to 2
vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"] # Only use 90% of each core
```

Feel free to adjust these values to what your system allows.

***NOTE: Vagrant VM must be restarted for changes to take effect: `vagrant halt`, then `vagrant up`***

# Removing VM
When you have completed using your Vagrant VM, you can run `vagrant destroy` and that will delete it from your system.

***NOTE: you can always recover/rebuild your VM using `vagrant up`***
