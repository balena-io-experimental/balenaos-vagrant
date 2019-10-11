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
    class Guest < Vagrant.plugin('2', :guest)
      def detect?(machine)
        machine.communicate.test('cat /etc/os-release | grep balenaOS')
      end
    end
  end
end
