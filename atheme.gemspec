# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'atheme/version'

Gem::Specification.new do |spec|
  spec.name          = 'atheme'
  spec.version       = Atheme::VERSION
  spec.authors       = ['James Newton', 'Robert Babcock']
  spec.email         = ['james@Zaphyous.com', 'robert@Zaphyous.com']
  spec.description   = %q{A ruby wrapper around the Atheme IRC Services XMLRPC interface}
  spec.summary       = %q{atheme-ruby is an easy way to integrate your ruby application with the Atheme IRC Services XMLRPC interface}
  spec.homepage      = 'https://github.com/zaphyous/atheme'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'
end
