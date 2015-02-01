# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/coreos/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-coreos"
  spec.version       = Capistrano::CoreOS::VERSION
  spec.authors       = ["Seigo Uchida"]
  spec.email         = ["spesnova@gmail.com"]
  spec.summary       = spec.description
  spec.description   = "Managing CoreOS by Capistrano"
  spec.homepage      = "https://github.com/spesnova/capistrano-coreos"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 3.3.5"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
