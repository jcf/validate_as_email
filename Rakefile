#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'appraisal'

Dir['tasks/**/*.rake'].each(&method(:load))

desc 'Run specs and features'
task :default => [:spec, :cucumber]
