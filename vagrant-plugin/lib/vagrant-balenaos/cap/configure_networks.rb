require 'set'
require 'tempfile'
require 'pathname'
require 'vagrant/util/template_renderer'

module VagrantPlugins
  module GuestBalenaOS
    module Cap
      class ConfigureNetworks
        def self.source_root
          @source_root ||= Pathname.new(File.expand_path('../../../../', __FILE__))
        end
        include Vagrant::Util
        def self.configure_networks(machine, networks)
          machine.communicate.tap do |comm|

            comm.execute("sed -e '/^#VAGRANT-BEGIN/,$ d' /etc/network/interfaces > /tmp/vagrant-network-interfaces.pre")
            comm.execute("sed -ne '/^#VAGRANT-END/,$ p' /etc/network/interfaces | tail -n +2 > /tmp/vagrant-network-interfaces.post")

            interfaces = Set.new
            entries = []
            networks.each do |network|
              interfaces.add(network[:interface])
              entry = TemplateRenderer.render("guests/balenaos/network_#{network[:type]}", { options: network, template_root: source_root.join('templates') })
              entries << entry
            end

            temp = Tempfile.new('vagrant')
            temp.binmode
            temp.write(entries.join("\n"))
            temp.close

            comm.upload(temp.path, '/tmp/vagrant-network-entry')

            interfaces.each do |interface|
              comm.execute("/sbin/ifdown eth#{interface} 2>/dev/null")
              comm.execute("/sbin/ip addr flush dev eth#{interface} 2>/dev/null")
            end

            comm.execute('cat /tmp/vagrant-network-interfaces.pre /tmp/vagrant-network-entry /tmp/vagrant-network-interfaces.post > /etc/network/interfaces')
            comm.execute('rm -f /tmp/vagrant-network-interfaces.pre /tmp/vagrant-network-entry /tmp/vagrant-network-interfaces.post')

            interfaces.each do |interface|
              comm.execute("/sbin/ifup eth#{interface}")
            end
          end
        end
      end
    end
  end
end
