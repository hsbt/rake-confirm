# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rake/confirm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["SHIBATA Hiroshi"]
  gem.email         = ["shibata.hiroshi@gmail.com"]
  gem.description   = %q{Confirmation for destructive Rails task.}
  gem.summary       = %q{Confirmation for destructive Rails task.}
  gem.homepage      = "https://github.com/hsbt/rake-confirm"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rake-confirm"
  gem.require_paths = ["lib"]
  gem.version       = Rake::Confirm::VERSION
end
