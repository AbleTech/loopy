# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loopy/version'

Gem::Specification.new do |gem|
  gem.name          = "loopy"
  gem.version       = Loopy::VERSION
  gem.authors       = ["Nigel Ramsay"]
  gem.email         = ["nigel.ramsay@abletech.co.nz"]
  gem.description   = %q{Simple class for running regularly repeated tasks}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "http://www.abletech.co.nz/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end
