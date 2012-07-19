# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mail_validator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['James Conroy-Finn']
  gem.email         = ['james@logi.cl']
  gem.description   = %q{The ultimate Rails 3 email validator}
  gem.summary       = %q{The ultimate Rails 3 email validator. Powered by the Mail gem.}
  gem.homepage      = 'https://github.com/evently/mail_validator'

  gem.files         = Dir['lib/**/*.rb'] << 'README.md'
  gem.test_files    = Dir['spec/**/*_spec.rb']
  gem.name          = 'mail_validator'
  gem.require_paths = ['lib']
  gem.version       = MailValidator::VERSION

  gem.add_dependency 'activemodel', '~> 3'
  gem.add_dependency 'mail', '~> 2'

  gem.add_development_dependency 'rspec-rails', '~> 2.11'
  gem.add_development_dependency 'cucumber', '~> 1.2'
  gem.add_development_dependency 'aruba', '~> 0.4'
end
