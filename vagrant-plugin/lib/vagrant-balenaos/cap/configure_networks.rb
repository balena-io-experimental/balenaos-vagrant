require 'set'
require 'tempfile'
require 'pathname'
require 'vagrant/util/template_renderer'

module VagrantPlugins
  module GuestBalenaOS
    module Cap
      class ConfigureNetworks
        def self.source_root
          @source_root ||= Pathname.new(File.expand_path('../../../', __dir__))
        end
        include Vagrant::Util
        def self.configure_networks(machine, networks)
          return
          # machine.communicate.tap do |comm|
          # end
        end
      end
    end
  end
end
