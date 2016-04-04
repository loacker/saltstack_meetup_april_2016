# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false

  config.vm.define 'salt' do |machine|
    machine.vm.hostname = 'salt'
    machine.vm.network "private_network", ip: "192.168.33.254"
    machine.vm.box = "loacker/centos7.2"
    machine.vm.provision "salt" do |salt|
      salt.install_master = true
    end
  end

  config.vm.define 'minion1' do |machine|
    machine.vm.hostname = 'minion1'
    machine.vm.network "private_network", ip: "192.168.33.10"
    machine.vm.box = "loacker/centos7.2"
    machine.vm.provision "shell", inline: "echo \"192.168.33.254 salt\" >> /etc/hosts"
    machine.vm.provision "salt"
  end

  config.vm.define 'minion2' do |machine|
    machine.vm.hostname = 'minion2'
    machine.vm.network "private_network", ip: "192.168.33.20"
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.provision "shell", inline: "echo \"192.168.33.254 salt\" >> /etc/hosts"
    machine.vm.provision "salt"
  end

  config.vm.define 'minion3' do |machine|
    machine.vm.hostname = 'minion3'
    machine.vm.network "private_network", ip: "192.168.33.30"
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.provision "shell", inline: "echo \"192.168.33.254 salt\" >> /etc/hosts"
    machine.vm.provision "salt"
  end

  config.vm.provider :libvirt do |domain|
    domain.memory = 1024
    domain.cpus = 2
    domain.nested = true
    domain.volume_cache = 'none'
  end
  
end
