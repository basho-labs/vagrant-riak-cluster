# -*- mode: ruby -*-
# vi: set ft=ruby :

CENTOS = {
  box: "riak-1.4.7-centos-6.5",
  virtualbox_url: "http://vagrant-riak-cluster.s3.amazonaws.com/virtualbox/riak-1.4.7-centos-6.5.box",
  vmware_fusion_url: "http://vagrant-riak-cluster.s3.amazonaws.com/vmware/riak-1.4.7-centos-6.5.box"
}
UBUNTU = {
  box: "riak-1.4.7-ubuntu-12.04",
  virtualbox_url: "http://vagrant-riak-cluster.s3.amazonaws.com/virtualbox/riak-1.4.7-ubuntu-12.04.box",
  vmware_fusion_url: "http://vagrant-riak-cluster.s3.amazonaws.com/vmware/riak-1.4.7-ubuntu-12.04.box"
}

VAGRANTFILE_API_VERSION = "2"
NODES         = ENV["RIAK_NODES"].nil? ? 3 : ENV["RIAK_NODES"].to_i
OS            = ENV["RIAK_OS"].nil? ? CENTOS : Kernel.const_get(ENV["RIAK_OS"])

Vagrant.configure(VAGRANTFILE_API_VERSION) do |cluster|
  # Ensure latest version of Chef is installed.
  cluster.omnibus.chef_version = :latest

  # Utilize the Cachier plugin to cache downloaded packages.
  unless ENV["RIAK_CACHE"].nil?
    cluster.cache.auto_detect = true
  end

  # Utilize the Berkshelf plugin to resolve cookbook dependencies.
  cluster.berkshelf.enabled = true
  cluster.berkshelf.berksfile_path ="./Berksfile"
  
  (1..NODES).each do |index|
    last_octet = index * 10

    cluster.vm.define "riak#{index}".to_sym do |config|
      config.vm.box = OS[:box]

      config.vm.provider :virtualbox do |vb, override|
        override.vm.box_url = OS[:virtualbox_url]

        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
      end

      config.vm.provider :vmware_fusion do |vm, override|
        override.vm.box_url = OS[:vmware_fusion_url]

        vm.vmx["memsize"] = "1024"
        vm.vmx["numvcpus"] = "2"
      end

      config.vm.hostname = "riak#{index}"
      config.vm.network :private_network, ip: "33.33.33.#{last_octet}"

      # Provision using Chef.
      config.vm.provision :chef_solo do |chef|
        chef.roles_path = "roles"

        chef.add_role "base"
        chef.add_role "riak"

        chef.json = {
          "riak" => {
            "args" => {
              "-name" => "riak@33.33.33.#{last_octet}.xip.io"
            },
            "config" => {
              "riak_api" => {
                "pb" =>
                  { "__string_33.33.33.#{last_octet}" => 8087 }
              },
              "riak_core" => {
                "http" =>
                  { "__string_33.33.33.#{last_octet}" => 8098 }
              }
            }
          }
        }
      end

      if index > 1
        config.vm.provision :shell, inline: <<-CLUSTER_JOIN
          riak-admin cluster join riak@33.33.33.10.xip.io
        CLUSTER_JOIN

        if NODES > 1 && index == NODES
          config.vm.provision :shell, inline: <<-CLUSTER_COMMIT
            sleep 5

            riak-admin cluster plan
            riak-admin cluster commit
          CLUSTER_COMMIT
        end
      end
    end
  end
end
