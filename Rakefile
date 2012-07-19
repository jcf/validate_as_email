#!/usr/bin/env rake
require 'bundler/gem_tasks'

Dir['tasks/**/*.rake'].each(&method(:load))


desc 'Run specs'
task :default => [:spec, :cucumber]
