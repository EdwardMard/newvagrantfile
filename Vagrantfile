# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
                
       config.vm.define "eduard1" do |vm1|

                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard1"
                vm1.vm.network :private_network, ip: "192.168.56.9"

                vm1.vm.provision "shell", inline: <<-SHELL
                        echo "Hello from the fucking Ubuntu VM ;)"
                SHELL

                vm1.vm.provider :virtualbox do |vb|
                        vb.name = "eduard1"
                        vb.gui = false
                        vb.memory = "1024"
                end

                vm1.vm.provision "file", source: "/Users/macbook/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
        	


        end
     

end
