# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin/subnav/version'

Gem::Specification.new do |spec|
  spec.name          = "active_admin-subnav"
  spec.version       = Activeadmin::Subnav::VERSION
  spec.authors       = ["Charles Maresh"]
  spec.email         = ["charles.maresh@orm-tech.com"]
  spec.summary       = %q{Provide sub-navigation menu for resources belonging to a parent resource.}
  spec.description   = <<DESC
Currently, ActiveAdmin 1.0pre resets the top navigation menu to display the sub
navigation menu for all resources related to that parent resource. This gem
provides a sub navigation menu for those resources.
DESC
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activeadmin"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-spec-expect"
  spec.add_development_dependency "sass-rails"
end
