module VagrantPlugins
  module GuestBalenaOS
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          new(machine, name).change!
        end

        attr_reader :machine, :new_hostname

        def initialize(machine, new_hostname)
          @machine = machine
          @new_hostname = new_hostname
        end

        def change!
          return unless should_change?
          fail 'Do not change the hostname on balenaOS.'
        end

        def should_change?
          new_hostname != current_hostname
        end

        def current_hostname
          @current_hostname ||= fetch_current_hostname
        end

        def fetch_current_hostname
          hostname = ''
          sudo 'hostname -f' do |type, date|
            hostname = data.chomp if type == :stdout && hostname.empty?
          end
          hostname
        end

        def test(cmd)
          machine.communicate.test(cmd)
        end
      end
    end
  end
end
