require 'rspec/core/rake_task'

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.ruby_opts = '-w'
end

desc 'Run specs'
task default: :spec
