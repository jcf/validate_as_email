# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validate_as_email/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['James Conroy-Finn']
  gem.email         = ['james@logi.cl']
  gem.description   = %q{The ultimate Rails 3 email validator}
  gem.summary       = %q{The ultimate Rails 3 email validator. Powered by the Mail gem.}
  gem.homepage      = 'https://github.com/evently/mail_validator'

  gem.files         = Dir['lib/**/*'] + ['README.md', 'LICENSE']
  gem.test_files    = Dir['{features,spec}/**/*']

  gem.name          = 'validate_as_email'
  gem.require_paths = ['lib']
  gem.version       = ValidateAsEmail::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_dependency 'activemodel', '>= 3'
  gem.add_dependency 'mail', '~> 2'

  gem.add_development_dependency 'rake', '~> 0.9.2'
  gem.add_development_dependency 'rspec-rails', '~> 2.11'
  gem.add_development_dependency 'cucumber', '~> 1.2'
  gem.add_development_dependency 'aruba', '~> 0.4'
  gem.add_development_dependency 'appraisal', '~> 0.4'

  gem.add_development_dependency 'activerecord', '>= 3'
  gem.add_development_dependency 'sqlite3', '~> 1.3'
end
