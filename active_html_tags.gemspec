require_relative "lib/active_html_tags/version"

Gem::Specification.new do |spec|
  spec.name        = "active_html_tags"
  spec.version     = ActiveHtmlTags::VERSION
  spec.authors     = ["Fabian stillhart"]
  spec.email       = ["fabian_stillhart@hotmail.com"]
  spec.homepage    = ""
  spec.summary     = "A simple helper to use html tags as a method like content_tag"
  spec.description = "Annoyed to write content_tag(:span, 'LOL')? Just use all the html tags helpers like span('lol') to avoid writing to much code while having the safety of rails."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "http://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
end
