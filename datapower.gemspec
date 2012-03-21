#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

require File.expand_path('../lib/datapower/version', __FILE__)

Gem::Specification.new do |s|
  s.authors       = ["tnarik"]
  s.email         = Base64.decode64("dG5hcmlrQGdtYWlsLmNvbQ==\n")
  s.summary       = "Datapower administration gem"
  s.description   = "#{s.summary}. This allows command line interaction with Datapower devices"
  s.homepage      = "http://lecafeautomatique.co.uk"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = "datapower"
  s.require_paths = ["lib"]
  s.version       = Datapower::VERSION
  
  # generate
  s.add_development_dependency 'changelog'
    
  begin
    require "changelog"
  rescue LoadError
    warn "You have to have changelog gem installed for post install message"
  else
    s.post_install_message = CHANGELOG.new.version_changes
  end

end
