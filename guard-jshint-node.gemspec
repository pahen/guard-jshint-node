# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/jshint-node"

Gem::Specification.new do |s|
  s.name        = "guard-jshint-node"
  s.version     = Guard::JshintNode::VERSION
  s.authors     = ["Patrik Henningsson"]
  s.email       = ["patrik.henningsson@gmail.com"]
  s.homepage    = "http://github.com/pahen/guard-jshint-node"
  s.summary     = "Guard gem for running JSHint"
  s.description = "Guard::JshintNode automatically runs JSHint when watched files are modified."

  s.rubyforge_project = "guard-jshint-node"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '>= 0.8.8'
end