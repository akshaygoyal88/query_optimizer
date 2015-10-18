# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'query_optimizer/version'

Gem::Specification.new do |spec|
  spec.name          = "query_optimizer"
  spec.version       = QueryOptimizer::VERSION
  spec.authors       = ["Akshay"]
  spec.email         = ["akshay.goyal1008@gmail.com"]
  spec.summary       = %q{This is rails gem which will minimize query for many_to_many relationship}
  spec.description   = %q{This is rails gem which will minimize query for many_to_many relationship.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end