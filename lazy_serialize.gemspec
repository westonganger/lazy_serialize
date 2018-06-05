lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lazy_serialize/version.rb'

Gem::Specification.new do |s|
  s.name        = 'lazy_serialize'
  s.version     =  LazySerialize::VERSION
  s.author	= "Weston Ganger"
  s.email       = 'weston@westonganger.com'
  s.homepage 	= 'https://github.com/westonganger/lazy_serialize'
  
  s.summary     = "Lazy Serialize is an alternative to ActiveRecord's `serialize` method which does not serialize each column until the first call to the attribute."
  s.description = "Lazy Serialize is an alternative to ActiveRecord's `serialize` method which does not serialize each column until the first call to the attribute."

  s.files = Dir.glob("{lib/**/*}") + %w{ LICENSE README.md Rakefile CHANGELOG.md }
  s.test_files  = Dir.glob("{test/**/*}")

  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'yaml'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'activerecord'

  s.required_ruby_version = '>= 1.9.3'
  s.require_path = 'lib'
end
