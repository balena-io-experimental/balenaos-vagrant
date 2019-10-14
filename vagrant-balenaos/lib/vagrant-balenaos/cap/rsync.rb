require "shellwords"

module VagrantPlugins
  module GuestBalenaOS
    module Cap
      class RSync
        def self.rsync_installed(machine)
          machine.communicate.test('which rsync')
        end

        def self.rsync_command(machine)
          'rsync'
        end

        def self.rsync_pre(machine, opts)
          machine.communicate.tap do |comm|
            comm.execute("mkdir -p '#{opts[:guestpath]}'")
          end
        end

        def self.rsync_post(machine, opts)
          if opts.key?(:chown) && !opts[:chown]
            return
          end
          machine.communicate.execute("#{self.build_rsync_chown(opts)}")
        end

        def self.build_rsync_chown(opts)
          guest_path = Shellwords.escape(opts[:guestpath])
          "chown #{opts[:owner]}:#{opts[:group]} -R #{guest_path}"
        end
      end
    end
  end
end
