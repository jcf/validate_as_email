require 'bundler'
Bundler.setup

require 'aruba/cucumber'

# Borrowed from VCR
additional_paths = []

Before do
  load_paths, requires = ['../../lib'], []

  # Put any bundler-managed gems (such as :git gems) on the load path
  # for when aruba shells out.  Alternatively, we could hook up aruba to
  # use bundler when it shells out, but invoking bundler for each and
  # every time aruba starts ruby would slow everything down. We really
  # only need it for bundler-managed gems.
  load_paths.push($LOAD_PATH.grep %r|bundler/gems|)

  if RUBY_VERSION < '1.9'
    requires << 'rubygems'
  else
    load_paths << '.'
  end

  requires << '../../features/support/cucumber_helpers'
  requires.map! { |r| "-r#{r}" }
  set_env('RUBYOPT', "-I#{load_paths.join(':')} #{requires.join(' ')}")

  if additional_paths.any?
    existing_paths = ENV['PATH'].split(':')
    set_env('PATH', (additional_paths + existing_paths).join(':'))
  end

  @aruba_timeout_seconds = RUBY_PLATFORM == 'java' ? 60 : 20
end
