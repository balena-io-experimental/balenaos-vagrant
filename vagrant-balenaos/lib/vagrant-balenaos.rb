# rubocop:disable Style/FileName
#
# squelch:
# lib/vagrant-balenaos.rb:1:1: C: Use snake_case for source file names.
# require 'pathname'
#
require 'pathname'
require 'vagrant-balenaos/plugin'

module VagrantPlugins
  module GuestBalenaOS
    # lib_path = Pathname.new(File.expand_path('../vagrant-balenaos', __FILE__))
    # autoload :Action, lib_path.join('action')
    # autoload :Errors, lib_path.join('errors')
  end
end
