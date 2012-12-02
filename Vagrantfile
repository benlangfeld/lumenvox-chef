require 'berkshelf/vagrant'

Vagrant::Config.run do |config|

  config.vm.host_name = "lumenvox-chef-berkshelf"

  config.vm.box = 'centos63_64min'
  config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box'

  config.vm.network :hostonly, "192.168.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {


    }
    chef.log_level = :debug

    chef.run_list = [
      "recipe[lumenvox::default]"
    ]
  end
end
