#!/usr/bin/env ruby

# Installs dependencies, or runs tests with support for parallelising each task
# across a number of Ruby versions. Commands are executed using `rvm-exec` to
# ensure the right Ruby version is used in child processes.
#
# Only compatible with CircleCI.
#
#   Usage: ci/run.rb <deps|test> PROCESS_COUNT PROCESS_NUMBER

# ------------------------------------------------------------------------------
# Configuration

RUBY_VERSIONS = %w(
  1.9.3-p551
  2.1.7
  2.2.3
  jruby-9.0.4.0
  rbx-2.5.2
)

GEMFILES = Dir.glob('gemfiles/*.gemfile')

# ------------------------------------------------------------------------------
# Argument validation

if ARGV.count != 3
  $stderr.puts "Usage: #{__FILE__} <deps|test> <total> <index>"
  exit 1
end

# ------------------------------------------------------------------------------
# Helpers

def say(s)
  $stderr.puts "\033[34;1m==>\033[0;1m #{s}\033[0m"
end

def err(s)
  $stderr.puts "\033[31;1m==>\033[0;1m #{s}\033[0m"
end

def spread(task, versions, &script)
  xs = versions.map do |version|
    system(script.call(version))
    puts
    { version: version, ps: $? }
  end
  err_found = false
  xs.each do |x|
    unless x[:ps].success?
      err_found = true
      err "#{x[:version]}: #{task} failed!"
    end
  end
  exit 1 if err_found
end

# ------------------------------------------------------------------------------
# Tasks

def deps(versions)
  say "Installing dependencies for versions #{versions.inspect}"
  spread('deps', versions) do |version|
    "rvm-exec #{version} bundle check " +
      '|| ' +
      "rvm-exec #{version} bundle install --jobs=4 --retry=3"
  end
end

def test(versions)
  say "Running tests for versions #{versions.inspect}"
  spread('deps', versions) do |version|
    "rvm-exec #{version} bundle exec rake"
  end
end

# ------------------------------------------------------------------------------
# Parallelisation - I really miss Clojure!

cmd, total, idx = *ARGV.to_a

total = total.to_i
buckets = Array.new(total, [])

RUBY_VERSIONS.each_with_index do |version, i|
  buckets[i % total] += [version]
end

versions = buckets[idx.to_i]

# ------------------------------------------------------------------------------
# Task dispatch

if cmd == 'test'
  test(versions)
elsif cmd == 'deps'
  deps(versions)
else
  deps(versions)
  test(versions)
end
