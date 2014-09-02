# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'mongoid_sortable_relation'
  s.version     = '0.0.0'
  s.authors     = ['Vladislav Melanitskiy']
  s.email       = %w(co@rademade.com)
  s.homepage    = 'https://github.com/Rademade/mongoid_sortable_relation'
  s.summary     = 'Extension for mongoid.'
  s.description = 'It adds possibility for sorting relation'
  s.licenses    = ['MIT']

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.require_path = 'lib'

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'mongoid', '~> 4.0'
  s.add_dependency 'mongoid_criteria_filter'

end