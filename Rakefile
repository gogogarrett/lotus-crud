# require 'bundler/gem_tasks'
require_relative './config/migrator'

# task default: :spec

namespace :db do
  task :migrate do
    Migrator.migrate!
  end
end
