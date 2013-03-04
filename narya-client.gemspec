# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'narya-client/version'

Gem::Specification.new do |gem|
  gem.name          = "narya-client"
  gem.version       = Narya::Client::VERSION
  gem.authors       = ["LupineDev"]
  gem.email         = ["chris@lupinedev.com"]
  gem.description   = %q{Client for interacting with Naria http API}
  gem.summary       = %q{Client for interacting with Naria http API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "faraday", ["0.8.5"]
  gem.add_runtime_dependency "json", ["1.7.7"]
  gem.add_development_dependency "rspec", ["2.12.0"]
end
