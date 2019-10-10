module VagrantPlugins
  module GuestBalenaOS
    module Cap
      class RSync
        def self.rsync_installed(machine)
          machine.communicate.test('test -f /usr/bin/rsync')
        end
      end
    end
  end
end
