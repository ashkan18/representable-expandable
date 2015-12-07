$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'representable/expandable/version'
Gem::Specification.new do |s|
  s.name = 'representable-expandable'
  s.version = Representable::Expandable::VERSION
  s.authors = ['Ashkan Nasseri']
  s.email = 'ashkan.nasseri@gmail.com'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/ashkan18/representable-expandable'
  s.licenses = ['MIT']
  s.summary = 'Expandable extension for Representable'
end
