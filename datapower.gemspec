#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

require File.expand_path('../lib/datapower/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tnarik"]
  gem.email         = Base64.decode64("dG5hcmlrQGdtYWlsLmNvbQ==\n")
  gem.summary       = "Datapower administration gem"
  gem.description   = "#{gem.summary}. This allows command line interaction with Datapower devices"
  gem.homepage      = "http://lecafeautomatique.co.uk"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "datapower"
  gem.require_paths = ["lib"]
  gem.version       = Datapower::VERSION
  
  begin
    require "changelog"
  rescue LoadError
    warn "You have to have changelog gem installed for post install message"
  else
    s.post_install_message = CHANGELOG.new.version_changes
  end

end
