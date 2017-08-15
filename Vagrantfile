# -*- mode: ruby -*-

Vagrant.configure("2") do |config|

	config.vm.provider "virtualbox" do |vbox|
	   ## Hipervisor configuration
	   vbox.name = "Vagrant_test_01"
	   vbox.gui = false
	   vbox.cpus = 1
	   vbox.memory = 1024
	end

	## BOX configuration
        config.vm.box = "ubuntu/xenial64"
	config.vm.box_check_update = true
	config.vm.hostname = "monitoring"
	
	## Network configuration
	config.vm.network "public_network", type: "dhcp", bridge: "eth0"
	config.vm.network "private_network", ip: "192.168.50.200", netmask: "24", auto_config: true
        config.vm.network "forwarded_port", guest: 3000, host: 3000

	## Services configuration
        config.vm.provision "file", source: "influxdb.conf", destination: "/tmp/influxdb-conf"
        config.vm.provision "file", source: "configdb_influxdb.txt", destination: "/tmp/configdb_influxdb.txt"
	config.vm.provision :shell, path: "config_grafana.sh", privileged: true
	config.vm.provision :shell, path: "config_influxdb.sh", privileged: true

	## Checking the status of the services
        config.vm.provision "shell", inline: <<-SHELL
	    ss -putan | egrep '(3000|808|22)'
        SHELL
end
