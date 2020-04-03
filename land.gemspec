$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "land/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "land"
  gem.version     = Land::VERSION

  gem.authors     = ["Erik Peterson"]
  gem.email       = ["thecompanygardener@gmail.com"]

  gem.homepage      = "https://github.com/companygardener/land"

  gem.license       = "MIT"

  gem.summary       = %q{Traffic tracking for Rails}
  gem.description   = %q{Clickstream tracking for Rails applications.}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if gem.respond_to?(:metadata)
    gem.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  gem.metadata["homepage_uri"]    = gem.homepage
  gem.metadata["source_code_uri"] = gem.homepage
  gem.metadata["changelog_uri"]   = "https://github.com/companygardener/land/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gem.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord", " > 4.0.0"
  gem.add_dependency "lookup_by",    "~> 0.11.0"

  gem.add_development_dependency "pg"
  gem.add_development_dependency "rake"

  gem.add_development_dependency "appraisal"

  gem.add_development_dependency "pry"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rspec-rails"
end
