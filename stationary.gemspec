# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stationary/version"

Gem::Specification.new do |s|
  s.name        = "stationary"
  s.version     = Stationary::VERSION
  s.authors     = ["Michael Deering"]
  s.email       = ["mdeering@mdeering.com"]
  s.homepage    = ""
  s.summary     = %q{Rails Engine For Serving Static Pages}
  s.description = %q{Configurable Rails Engine For Serving Static Pages}

  s.rubyforge_project = "stationary"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
