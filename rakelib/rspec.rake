begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new

  RSpec::Core::RakeTask.new('spec:strict') do |t|
    t.ruby_opts = '-w'
  end
rescue LoadError
  task(:spec) { abort "Rspec isn't available!" }
  task(:'spec:strict') { abort "Rspec isn't available!" }
end
