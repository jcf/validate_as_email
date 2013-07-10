require 'validate_as_email/version'
require 'active_model'
require 'active_model/validations/email_validator'

if defined?(RSpec::Matchers)
  require 'validate_as_email/rspec'
end
