# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bomberman/version'

Gem::Specification.new do |gem|
  gem.name          = "bomberman"
  gem.version       = Bomberman::VERSION
  gem.authors       = ["Ikayzo"]
  gem.email         = ["chris@ikayzo.com"]
  gem.summary       = %q{Shelter from profanity bombing}
  gem.description   = %q{Client for interacting with Bomberman HTTP API. For more information visit http://bomberman.ikayzo.com/}
  gem.homepage      = "https://github.com/ikayzo/bomberman-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "faraday", ["~>0.8.5"]
  gem.add_runtime_dependency "json", [">=1.7.7"]
  gem.add_development_dependency "rspec", ["~>2.12.0"]
  gem.add_development_dependency "webmock"
end
