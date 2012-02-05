# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "file_generator/version"

Gem::Specification.new do |s|
  s.name        = "file_generator"
  s.version     = FileGenerator::VERSION
  s.authors     = ["Martin Aceto"]
  s.email       = ["martin.aceto@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Generator of files using a format description}
  s.description = %q{Generator of files using a format description}

  s.rubyforge_project = "file_generator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
