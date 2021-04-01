# -*- mode: ruby -*-
# vi: set ft=rubt :

Vagrant.configure("2") do |config|
	config.vm.define "ubuntu-vm" do |vm1|
		vm1.vm.hostname = "ubuntu-vm"
		vm1.vm.box = "bento/ubuntu-20.04"
		vm1.vm.network "private_network", ip: "192.168.56.9"			

		vm1.vm.provider "virtualbox" do |vb|
			vb.name = "ubuntu-vm"
			vb.gui = false
			vb.memory = "1024"
		end
		
		vm1.vm.provision "shell", run: "always", inline: <<-SHELL
			echo "Hello from the Ubuntu VM"
		SHELL
	end
end
	
