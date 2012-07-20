Feature: RSpec matcher

  Scenario: The built-in RSpec matcher covers validation of email for you
    Given a file named "rspec_matcher.rb" with:
    """
    require 'active_model'
    require 'rspec'
    require 'validate_as_email'

    class Person
      include ActiveModel::Validations
      validates_as_email :email
      attr_accessor :email
    end

    describe Person do
      it { should_not have_a_valid_email_address_for(:email) }
    end
    """
    When I run `rspec rspec_matcher.rb`
    Then it should fail with:
    """
    not to have a valid email address for :email
    """
