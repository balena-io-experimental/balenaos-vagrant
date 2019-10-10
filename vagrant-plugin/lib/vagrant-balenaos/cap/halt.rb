module VagrantPlugins
  module GuestBalenaOS
    module Cap
      class Halt
        def self.halt(machine)
          begin
            machine.communicate.execute('poweroff')
          rescue Net::SSH::Disconnect, IOError
            # ignored, probably means connection was closed
            # bc of shutdown
          end
        end
      end
    end
  end
end
