# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/failed/version'

Gem::Specification.new do |spec|
  spec.name          = 'minitest-failed'
  spec.version       = Minitest::Failed::VERSION
  spec.authors       = ['Artem Petrov']
  spec.email         = ['partos0511@gmail.com']

  spec.summary       = %q{Minitest failed test runner}
  spec.description   = spec.summary
  spec.homepage      = 'http://github.com/artempartos/minitest-failed'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'minitest'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
