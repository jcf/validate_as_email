begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = '--format progress'
  end
rescue LoadError
  task(:cucumber) { abort "Cucumber isn't available!" }
end
