require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

RSpec::Core::RakeTask.new('spec:strict') do |t|
  t.ruby_opts = '-w'
end
