# Vagrant hints

Useful: http://www.virtualbox.org/manual/ch08.html

    config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
      v.customize ["modifyvm", :id, "--memory", "2024"]
      v.customize ["modifyvm", :id, "--cpus", 2]	
    end
