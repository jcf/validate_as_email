# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validate_as_email/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['James Conroy-Finn']
  gem.email         = ['james@logi.cl']
  gem.description   = %q{The ultimate Rails 3 email validator}
  gem.summary       = %q{The ultimate Rails 3 email validator. Powered by the Mail gem.}
  gem.homepage      = 'https://github.com/evently/mail_validator'

  gem.files         = Dir['lib/**/*'] + Dir['config/**/*'] + ['README.md', 'LICENSE']
  gem.test_files    = Dir['{features,spec}/**/*']

  gem.name          = 'validate_as_email'
  gem.require_paths = ['lib']
  gem.version       = ValidateAsEmail::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_runtime_dependency 'activemodel', '> 3', '< 5'
  gem.add_runtime_dependency 'mail', '~> 2.5'

  gem.add_dependency 'rspec_junit_formatter'
  gem.add_dependency 'rspec-rails'
end
