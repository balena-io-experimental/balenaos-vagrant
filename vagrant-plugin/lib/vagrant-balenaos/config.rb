module VagrantPlugins
  module GuestBalenaOS
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :suexec_cmd
      attr_accessor :device

      def initialize
        @suexec_cmd = 'exec'
        @device = 'e1000g'
      end
    end
  end
end
