#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/extensiontask"
require "rspec"
require "rspec/core/rake_task"

Rake::ExtensionTask.new("standard_deviation") do |ext|
  ext.lib_dir = File.join "lib", "standard_deviation"
end


RSpec::Core::RakeTask.new("spec") do |t|
  t.verbose = true
end

Rake::Task[:spec].prerequisites << :compile

task :test => :spec
task :default => :test
