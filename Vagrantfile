# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "ubuntu/trusty64"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # Node App Server
    config.vm.network "forwarded_port", guest: 9010, host: 9010
    # Karma Unit tests
    config.vm.network "forwarded_port", guest: 9011, host: 9011
    # LiveReload
    config.vm.network "forwarded_port", guest: 35729, host: 35729
    # Node Debugger
    config.vm.network "forwarded_port", guest: 5858, host: 5858

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    # config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Use NFS for shared folders for better performance
    # is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
    # config.vm.synced_folder '.', '/vagrant',
    #     :nfs => !is_windows,
    #     :mount_options => ['actimeo=2'],
    #     id: "shared"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
    end
    #
    # View the documentation for the provider you're using for more
    # information on available options.

    # Enable provisioning with shell script
    config.vm.provision :shell, path: "provision/bootstrap.sh"
    config.vm.provision :shell, path: "provision/node.sh"
    config.vm.provision :shell, path: "provision/mongodb.sh"
    config.vm.provision :shell, path: "provision/mysql.sh"
    config.vm.provision :shell, path: "provision/yeogurt.sh"
    config.vm.provision :shell, path: "provision/permissions.sh"
end
