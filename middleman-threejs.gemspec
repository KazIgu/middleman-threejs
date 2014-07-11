# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/threejs/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-threejs"
  spec.version       = Middleman::Threejs::VERSION
  spec.authors       = ["KazIgu"]
  spec.email         = ["kaz.igu.21@gmail.com"]
  spec.summary       = %q{three.js template on middleman}
  spec.description   = %q{three.js template on middleman}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
