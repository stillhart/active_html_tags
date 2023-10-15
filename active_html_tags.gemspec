require_relative 'lib/active_html_tags/version'

Gem::Specification.new do |spec|
  spec.name        = 'active_html_tags'
  spec.version     = ActiveHtmlTags::VERSION
  spec.authors     = ['Fabian stillhart']
  spec.email       = ['fabian_stillhart@hotmail.com']
  spec.homepage    = 'https://github.com/stillhart/active_html_tags'
  spec.summary     = 'A simple helper to bring content_tag to the next level'
  spec.description = "Annoyed to write tag.span('LOL')? Just use the new helpers as follows span('lol') to avoid writing to much code while having the safety of rails."
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'http://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/stillhart/active_html_tags'
  spec.metadata['changelog_uri'] = 'https://github.com/stillhart/active_html_tags'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 7', '>= 6.1.4.1'
end
