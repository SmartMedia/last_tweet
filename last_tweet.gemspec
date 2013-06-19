# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'last_tweet/version'

Gem::Specification.new do |gem|
  gem.name          = "last_tweet"
  gem.version       = LastTweet::VERSION
  gem.authors       = ["Vít Krchov"]
  gem.email         = ["vitkrchov@gmail.com"]
  gem.description   = %q{Load last tweet from accounts and save it to cache.}
  gem.summary       = %q{Load last tweet from accounts and save it to cache.}
  gem.homepage      = ""

  gem.add_dependency "twitter"
  gem.add_dependency "rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
