begin
  require "bundler/setup"
  require "bundler/gem_tasks"
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'lookup_by'
require "combustion"

Combustion::Application.configure_for_combustion
Combustion::Application.load_tasks

if defined?(ActiveRecord)
  ActiveRecord::Base.schema_format = :sql
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Land'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Lifted from appraisal/task to avoid deprecated clutter.
desc "Run the given task for all appraisals"
task :appraisal do
  ARGV.shift
  exec "bundle exec appraisal rake #{ARGV.join(' ')}"
end

if !ENV["APPRAISAL_INITIALIZED"] && !ENV["TRAVIS"]
  task default: :appraisal
else
  task default: :spec
end

# Clean up some clutter in `rake -T`.
%w[
  app:template
  app:update
  restart
].each { |name| Rake::Task[name].clear }

%w[
  clean
  clobber_rdoc
  install:local
  log:clear
  rerdoc
  secret
  time:zones
  tmp:clear
  tmp:create
].each { |name| Rake::Task[name].clear_comments }
