$:.push File.expand_path('lib', __dir__)

require 'blog/version'

Gem::Specification.new do |s|
  s.name        = 'blog'
  s.version     = Blog::VERSION
  s.authors     = ['Alba Cardenas']
  s.email       = ['alba.cardenas@continuum.cl']
  s.homepage    = 'https://github.com/a1b4/blog_engine'
  s.summary     = 'manager of articles and comments'
  s.description = 'engine to add a blog with articles and comment into your application'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'axlsx'
  s.add_dependency 'axlsx_rails'
  s.add_dependency 'rails', '~> 5.2.1', '>= 5.2.1.1'

  s.add_development_dependency 'pg'
end
