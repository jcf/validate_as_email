$: << 'lib'

begin
  require 'simplecov'
rescue LoadError
end

require 'validate_as_email'
require 'rspec/rails/extensions/active_record/base'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each(&method(:require))

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
