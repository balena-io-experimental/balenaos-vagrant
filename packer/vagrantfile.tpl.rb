# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.boot_timeout = 1800
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.box_check_update = true

  config.ssh.username = "root"
  config.ssh.guest_port = 22222
  config.ssh.insert_key = false

  config.vm.provider :libvirt do |v|
    v.video_vram = 256
    v.memory = 2048
    v.cpus = 4
    v.driver = "kvm"
  end
end
