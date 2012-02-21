# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stationary/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stationary"
  s.version     = Stationary::VERSION
  s.authors     = [ "Michael Deering" ]
  s.email       = [ "mdeering@mdeering.com"]
  s.homepage    = ""
  s.summary     = %q{Rails Engine For Serving Static Pages}
  s.description = %q{Configurable Rails Engine For Serving Static Pages}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.textile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
end
