lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-balenaos/version'

Gem::Specification.new do |spec|
  spec.name = 'vagrant-balenaos'
  spec.version = VagrantPlugins::GuestBalenaOS::VERSION
  spec.license = 'MIT'

  spec.authors = ['robert guenzler']
  spec.email = ['robert@gnzler.io']

  spec.summary = 'Enables Vagrant to manage BalenaOS Guests.'
  spec.homepage = 'https://github.com/balena-io-playground/vagrant-balenaos'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_path = 'lib'

  # CVE-2020-8130 : https://lists.debian.org/debian-lts-announce/2020/02/msg00026.html
  spec.add_development_dependency "rake", ">= 12.3.3"
end
