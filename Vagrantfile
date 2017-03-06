# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.define "riak" do |riak|
  	riak.vm.box = "centos/7"
        riak.vm.hostname = "riak"
#        riak.vm.network :private_network, ip: "192.168.50.25", bridge: "eth0"
#        riak.vm.network "forwarded_port", guest: 9200, host:9200
        riak.vm.provision "shell",
          path: "riak.provision.sh"
  end

  config.vbguest.auto_update = false
end
