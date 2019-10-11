begin
  require 'vagrant'
rescue
  raise 'The Vagrant BalenOS Guest plugin must be run within Vagrant.'
end

if Vagrant::VERSION < '1.7.0'
  fail 'The Vagrant BalenOS Guest plugin is only compatible with Vagrant 1.7+'
end

module VagrantPlugins
  module GuestBalenaOS
    class Plugin < Vagrant.plugin('2')
      name 'BalenaOS guest'
      description 'BalenaOS guest support.'

      config('balenaos') do
        require_relative 'config'
        Config
      end

      guest('balenaos', 'linux') do
        require_relative 'guest'
        Guest
      end

      guest_capability('balenaos', 'configure_networks') do
        require_relative 'cap/configure_networks'
        Cap::ConfigureNetworks
      end

      guest_capability('balenaos', 'halt') do
        require_relative 'cap/halt'
        Cap::Halt
      end

      guest_capability('balenaos', 'change_host_name') do
        require_relative 'cap/change_host_name'
        Cap::ChangeHostName
      end

      guest_capability('balenaos', 'rsync_installed') do
        require_relative 'cap/rsync'
        Cap::RSync
      end

      guest_capability('balenaos', 'rsync_command') do
        require_relative 'cap/rsync'
        Cap::RSync
      end

      guest_capability('balenaos', 'rsync_pre') do
        require_relative 'cap/rsync'
        Cap::RSync
      end

      guest_capability('balenaos', 'rsync_post') do
        require_relative 'cap/rsync'
        Cap::RSync
      end
    end
  end
end
