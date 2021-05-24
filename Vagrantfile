# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


	 config.vm.define "eduard2" do |vm1|
                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard2"
                vm1.vm.network :private_network, ip: "192.168.56.20"
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


		vm1.vm.provision "shell", inline: <<-SHELL
        		sudo echo '192.168.56.19 eduard1 puppet' >> /etc/hosts
                	sudo echo '192.168.56.20 eduard2' >> /etc/hosts
                	sudo apt-get -y install ntp
                	wget https://apt.puppetlabs.com/puppet6-release-focal.deb
                	sudo dpkg -i puppet6-release-focal.deb
                	sudo apt-get update -y
                	sudo apt-get install puppet-agent -y
                	echo '[main]' >>  /etc/puppetlabs/puppet/puppet.conf
                	echo 'certname = eduard2' >>  /etc/puppetlabs/puppet/puppet.conf
                	echo 'server = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
                	echo 'runinterval = 70' >>  /etc/puppetlabs/puppet/puppet.conf
                	sudo systemctl start puppet
                	sudo systemctl enable puppet

		SHELL

#       config.vm.provision "shell", inline: <<-SHELL

#                        sudo systemctl start puppetserver
#                        sudo systemctl enable puppetserver
#
#                       sudo /opt/puppetlabs/bin/puppetserver ca list --all
#                       sudo /opt/puppetlabs/bin/puppetserver ca sign --all
#                       sudo /opt/puppetlabs/bin/puppet agent --test
#       SHELL

        end





       config.vm.define "eduard1" do |vm2|

                vm2.vm.box = "bento/ubuntu-20.04"
                vm2.vm.hostname = "eduard1"
                vm2.vm.network :private_network, ip: "192.168.56.19"

                vm2.vm.provision "shell", inline: <<-SHELL
			echo /Users/macbook/.ssh/id_rsa.pub >> /Users/macbook/newvagrantfile/public_keys
			echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                        echo "Hello from the fucking Ubuntu VM ;)"
                SHELL

                config.vm.provider :virtualbox do |vb|
                        vb.name = "eduard1"
                        vb.gui = false
                        vb.memory = "1024"
                end

		vm2.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
		
		vm2.vm.provision "shell", inline: <<-SHELL
                	sudo echo '192.168.56.19 eduard1 puppet' >> /etc/hosts
                        sudo echo '192.168.56.20 eduard2' >> /etc/hosts
                        sudo apt-get -y install ntp
                        sudo apt-get update -y
                        wget https://apt.puppetlabs.com/puppet6-release-focal.deb 
			ls -la
                        sudo dpkg -i puppet6-release-focal.deb
                        sudo apt-get update -y
                        sudo apt-get install puppetserver -y
			sudo sed -i 's/.*JAVA_ARGS.*/JAVA_ARGS="-Xms256m -Xmx256m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"/' /etc/default/puppetserver
#			sudo >> ~/etc/puppetlabs/puppet/autosign.conf
#			echo 'autosign = /path/to/autosign.conf' >> /etc/puppetlabs/puppet/puppet.conf
#                        echo 'autosign = true' >> /etc/puppetlabs/puppet/puppet.conf
#			echo 'autosign = /etc/puppetlabs/puppet/autosign.sh' >>  /etc/puppetlabs/puppet/puppet.conf

			echo '[main]' >>  /etc/puppetlabs/puppet/puppet.conf
			echo 'certname = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
			echo 'server = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
#			echo 'runinterval = 100' >>  /etc/puppetlabs/puppet/puppet.conf
			

			sudo systemctl start puppetserver 
			sudo systemctl enable puppetserver
			sleep 60
						
			sudo /opt/puppetlabs/bin/puppetserver ca list --all
			sudo /opt/puppetlabs/bin/puppetserver ca sign --all
                	sudo /opt/puppetlabs/bin/puppet agent --test


            SHELL
        	
#		vm1.vm.provision "shell", inline: <<-SHELL
#                	sudo service puppetserver reload
#	        SHELL


       



#	config.vm.define "eduard2" do |vm1|
#		vm1.vm.box = "bento/ubuntu-20.04"
#                vm1.vm.hostname = "eduard2"
#                vm1.vm.network :private_network, ip: "192.168.56.20"
#                vm1.vm.provision "shell", inline: <<-SHELL
#   			echo /Users/macbook/.ssh/id_rsa.pub >> ~/Users/macbook/newvagrantfile/public_keys
#                	echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
#                	echo "Hello from the fucking Ubuntu VM ;)"
#                SHELL
#	vm1.vm.provider :virtualbox do |vb|
#        	vb.name = "eduard2"
#                vb.gui = false
#                vb.memory = "1024"
#       end

#                vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"


#		vm1.vm.provision "shell", inline: <<-SHELL
#                        sudo echo '192.168.56.19 eduard1 puppet' >> /etc/hosts
#                        sudo echo '192.168.56.20 eduard2' >> /etc/hosts
#                        sudo apt-get -y install ntp
#			wget https://apt.puppetlabs.com/puppet6-release-focal.deb
#			sudo dpkg -i puppet6-release-focal.deb
#			sudo apt-get update -y 
#			sudo apt-get install puppet-agent -y
#			echo '[main]' >>  /etc/puppetlabs/puppet/puppet.conf
#                        echo 'certname = eduard2' >>  /etc/puppetlabs/puppet/puppet.conf
#                        echo 'server = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
#			echo 'runinterval=5' >>  /etc/puppetlabs/puppet/puppet.conf 
#			sudo systemctl start puppet
#			sudo systemctl enable puppet
			
#               	SHELL

#	config.vm.provision "shell", inline: <<-SHELL
                        
#                        sudo systemctl start puppetserver
#                        sudo systemctl enable puppetserver
#			
#			sudo /opt/puppetlabs/bin/puppetserver ca list --all
#	                sudo /opt/puppetlabs/bin/puppetserver ca sign --all
#	                sudo /opt/puppetlabs/bin/puppet agent --test
#	SHELL
	end
	 		

end

