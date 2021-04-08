# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
                
       config.vm.define "eduard1" do |vm1|

                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard1"
                vm1.vm.network :private_network, ip: "192.168.56.9"

                vm1.vm.provision "shell", inline: <<-SHELL
			echo /Users/macbook/.ssh/id_rsa.pub >> /Users/macbook/newvagrantfile/public_keys
			echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                        echo "Hello from the fucking Ubuntu VM ;)"
                SHELL

                config.vm.provider :virtualbox do |vb|
                        vb.name = "eduard1"
                        vb.gui = false
                        vb.memory = "1024"
                end

		vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
        	
        end

	config.vm.define "eduard2" do |vm1|
		vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard2"
                vm1.vm.network :private_network, ip: "192.168.56.10"
                vm1.vm.provision "shell", inline: <<-SHELL
   			echo /Users/macbook/.ssh/id_rsa.pub >> ~/Users/macbook/newvagrantfile/public_keys
                	echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                	echo "Hello from the fucking Ubuntu VM ;)"
                SHELL
                vm1.vm.provider :virtualbox do |vb|
                        vb.name = "eduard2"
                        vb.gui = false
                        vb.memory = "1024"
                end

                vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"



        end
	
	 config.vm.define "eduard3" do |vm1|
                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard3"
                vm1.vm.network :private_network, ip: "192.168.56.11", port: "22"
                vm1.vm.provision "shell", inline: <<-SHELL
                	echo /Users/macbook/.ssh/id_rsa.pub >> ~/Users/macbook/newvagrantfile/public_keys
                	echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                	echo "Hello from the fucking Ubuntu VM ;)"
                SHELL
                vm1.vm.provider :virtualbox do |vb|
                        vb.name = "eduard3"
                        vb.gui = false
                        vb.memory = "1024"
                end

                vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"



        end

	 config.vm.define "eduard4" do |vm1|
                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard4"
                vm1.vm.network :private_network, ip: "192.168.56.12", port: "22"
                vm1.vm.provision "shell", inline: <<-SHELL
                	echo /Users/macbook/.ssh/id_rsa.pub >> ~/Users/macbook/newvagrantfile/public_keys
                	echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                	echo "Hello from the fucking Ubuntu VM ;)"
                SHELL
                vm1.vm.provider :virtualbox do |vb|
                        vb.name = "eduard4"
                        vb.gui = false
                        vb.memory = "1024"
                end

                vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"



        end
	
	 config.vm.define "eduard5" do |vm1|
                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard5"
                vm1.vm.network :private_network, ip: "192.168.56.13", port: "22"
                vm1.vm.provision "shell", inline: <<-SHELL
                	echo /Users/macbook/.ssh/id_rsa.pub >> ~/Users/macbook/newvagrantfile/public_keys
                	echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                	echo "Hello from the fucking Ubuntu VM ;)"
                SHELL
                vm1.vm.provider :virtualbox do |vb|
                        vb.name = "eduard5"
                        vb.gui = false
                        vb.memory = "1024"
                end

                vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"



        end
	
     

end

