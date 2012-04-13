# -*- encoding: utf-8 -*-
require File.expand_path('../lib/standard_deviation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rodrigo Navarro"]
  gem.email         = ["rnavarro1@gmail.com"]
  gem.description   = %q{An implementation of the standard deviation calculation in C,
                         with much better performance (50x-100x) than using pure ruby.}
  gem.summary       = %q{Native extension for Ruby to calculate standard deviation.}
  gem.homepage      = "https://github.com/reu/standard_deviation"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.extensions    = ["ext/standard_deviation/extconf.rb"]
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "standard_deviation"
  gem.require_paths = ["lib", "ext"]
  gem.version       = StandardDeviation::VERSION

  gem.add_development_dependency "rake-compiler"
  gem.add_development_dependency "rspec"
end
