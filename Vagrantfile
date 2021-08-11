# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	 config.vm.define "eduard3" do |vm1|
                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard3"
                vm1.vm.network :private_network, ip: "192.168.56.21"
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

		vm1.vm.provision "file", source: "/Users/macbook/newvagrantfile/HelloWorld-1.0.jar", destination: "/home/vagrant/HelloWorld-1.0.jar"		

                vm1.vm.provision "shell", inline: <<-SHELL
                        sudo echo '192.168.56.19 eduard1' >> /etc/hosts
			sudo echo '192.168.56.20 eduard2' >> /etc/hosts
                        sudo echo '192.168.56.21 eduard3' >> /etc/hosts
                        sudo apt-get -y install ntp
                        wget https://apt.puppetlabs.com/puppet6-release-focal.deb
                        sudo dpkg -i puppet6-release-focal.deb
                        sudo apt-get update -y
                        sudo apt-get install puppet-agent -y                        
			echo '[main]' >>  /etc/puppetlabs/puppet/puppet.conf
                        echo 'certname = eduard3' >>  /etc/puppetlabs/puppet/puppet.conf
                        echo 'server = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
                        echo 'runinterval = 150' >>  /etc/puppetlabs/puppet/puppet.conf
			echo '[agent]' >>  /etc/puppetlabs/puppet/puppet.conf
                        echo 'runinterval = 140' >>  /etc/puppetlabs/puppet/puppet.conf

                        sudo systemctl start puppet
                        sudo systemctl enable puppet
                SHELL

	end


	 config.vm.define "eduard2" do |vm1|
                vm1.vm.box = "bento/ubuntu-20.04"
                vm1.vm.hostname = "eduard2"
                vm1.vm.network :private_network, ip: "192.168.56.20"
                vm1.vm.provision "shell", inline: <<-SHELL
                        echo /Users/macbook/.ssh/id_rsa.pub >> ~/Users/macbook/newvagrantfile/public_keys
                        echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                SHELL
        	vm1.vm.provider :virtualbox do |vb|
                	vb.name = "eduard2"
                	vb.gui = false
                	vb.memory = "1024"
        	end

                vm1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

		vm1.vm.provision "file", source: "/Users/macbook/newvagrantfile/HelloWorld-1.0.jar", destination: "/home/vagrant/HelloWorld-1.0.jar"

		vm1.vm.provision "shell", inline: <<-SHELL
        		sudo echo '192.168.56.19 eduard1' >> /etc/hosts
                	sudo echo '192.168.56.20 eduard2' >> /etc/hosts
			sudo echo '192.168.56.21 eduard3' >> /etc/hosts
                	sudo apt-get -y install ntp
                	wget https://apt.puppetlabs.com/puppet6-release-focal.deb
                	sudo dpkg -i puppet6-release-focal.deb
                	sudo apt-get update -y
                	sudo apt-get install puppet-agent -y
                	echo '[main]' >>  /etc/puppetlabs/puppet/puppet.conf
                	echo 'certname = eduard2' >>  /etc/puppetlabs/puppet/puppet.conf
                	echo 'server = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
                	echo 'runinterval = 140' >>  /etc/puppetlabs/puppet/puppet.conf
	       				

		      	sudo systemctl start puppet
                	sudo systemctl enable puppet

		SHELL

        end

       config.vm.define "eduard1" do |vm2|

                vm2.vm.box = "bento/ubuntu-20.04"
                vm2.vm.hostname = "eduard1"
                vm2.vm.network :private_network, ip: "192.168.56.19"

                vm2.vm.provision "shell", inline: <<-SHELL
			echo /Users/macbook/.ssh/id_rsa.pub >> /Users/macbook/newvagrantfile/public_keys
			echo /Users/macbook/newvagrantfile/public_keys >> /home/vagrant/.ssh/authorized_keys
                SHELL

                config.vm.provider :virtualbox do |vb|
                        vb.name = "eduard1"
                        vb.gui = false
                        vb.memory = "1024"
                end

		vm2.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

		
		vm2.vm.provision "shell", inline: <<-SHELL
                	sudo echo '192.168.56.19 eduard1' >> /etc/hosts
                        sudo echo '192.168.56.20 eduard2' >> /etc/hosts
			sudo echo '192.168.56.21 eduard3' >> /etc/hosts
                        sudo apt-get -y install ntp
                        sudo apt-get update -y
                        wget https://apt.puppetlabs.com/puppet6-release-focal.deb 
			ls -la

			curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
			sudo mkdir -p /var/lib/jenkins/.ssh/
			sudo cp -rp /home/vagrant/server_ca /var/lib/jenkins/.ssh/
			sudo chmod 600 /var/lib/jenkins/.ssh/server_ca
			

                        sudo dpkg -i puppet6-release-focal.deb
                        sudo apt-get update 
                        sudo apt-get install puppetserver -y
			sudo sed -i 's/.*JAVA_ARGS.*/JAVA_ARGS="-Xms256m -Xmx256m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"/' /etc/default/puppetserver

			wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
			sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

			wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#			sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ >  /etc/apt/sources.list.d/jenkins.list'
			sudo apt-get update

			echo '[main]' >>  /etc/puppetlabs/puppet/puppet.conf
			echo 'certname = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf
			echo 'server = eduard1' >>  /etc/puppetlabs/puppet/puppet.conf

			echo '[agent]' >>  /etc/puppetlabs/puppet/puppet.conf
                        echo 'runinterval = 130' >>  /etc/puppetlabs/puppet/puppet.conf			
						
			sudo systemctl start puppetserver 
			sudo systemctl enable puppetserver
			sleep 120
									
			sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apt -v 4.2.0  --force
                        sudo /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib --version 4.21.0  --force
			sudo /opt/puppetlabs/bin/puppet module install rtyler/jenkins
		
#			sudo /home/vagrant/.puppetlabs/etc/code/modules/puppet module install rtyler/jenkins

#			sudo /etc/puppetlabs/code/environments/production/modules/puppet module install puppetlabs-apt -v 4.2.0  --force   
#			sudo /etc/puppetlabs/code/environments/production/modules/puppet module install puppetlabs-stdlib --version 4.21.0  --force
#			sudo /etc/puppetlabs/code/environments/production/modules/puppet module install rtyler/jenkins


#			sudo /opt/puppetlabs/bin/puppetserver ca list --all
                        sudo /opt/puppetlabs/bin/puppetserver ca sign --all
			sudo puppetserver ca sign --all


			sudo /opt/puppetlabs/bin/puppet agent --test		
			
		SHELL

                vm2.vm.provision "file", source: "/Users/macbook/newvagrantfile/HelloWorld-1.0.jar", destination: "/home/vagrant/HelloWorld-1.0.jar"

		vm2.vm.provision "file", source: "/Users/macbook/newvagrantfile/puppet_file", destination: "/tmp/puppet_file"
		vm2.vm.provision "shell", inline: "mv /tmp/puppet_file/eduard1.pp /etc/puppetlabs/code/environments/production/manifests/eduard1.pp"
		vm2.vm.provision "shell", inline: "mv /tmp/puppet_file/eduard2.pp /etc/puppetlabs/code/environments/production/manifests/eduard2.pp"
		vm2.vm.provision "shell", inline: "mv /tmp/puppet_file/eduard3.pp /etc/puppetlabs/code/environments/production/manifests/eduard3.pp"
#		vm2.vm.provision "shell", inline: "mv /tmp/puppet_file/jenkins_file.pp /etc/puppetlabs/code/environments/production/manifests/jenkins_file.pp"
		vm2.vm.provision "shell", inline: "puppet agent --test"

#		sleep 120
#		vm2.vm.provision "file", source: "/Users/macbook/newvagrantfile/puppet_file/eduard_domain", destination: "/tmp/puppet_file/eduard_domain"
                vm2.vm.provision "shell", inline: "sudo systemctl restart nginx"



	end	 		

end

