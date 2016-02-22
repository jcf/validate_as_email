# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validate_as_email/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['James Conroy-Finn']
  gem.email         = ['james@logi.cl']
  gem.description   = %q{The ultimate email validator}
  gem.summary       = %q{The ultimate email validator. Powered by the Mail gem.}
  gem.homepage      = 'https://github.com/jcf/validate_as_email'

  gem.files         = Dir['lib/**/*'] + ['README.md', 'LICENSE']
  gem.test_files    = Dir['{features,spec}/**/*']

  gem.name          = 'validate_as_email'
  gem.require_paths = ['lib']
  gem.version       = ValidateAsEmail::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_dependency 'activemodel', '> 3', '< 4.1'
  gem.add_dependency 'mail', '~> 2.5'
end
