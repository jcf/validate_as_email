Feature: ActiveRecord validation

  Scenario Outline: Validation via <Macro>
    Given a file named "active_record_validation.rb" with:
    """
    require 'logger'
    require 'active_record'
    require 'mail_validator'

    setup_active_record

    class Person < ActiveRecord::Base
      <Macro>
    end

    a = Person.new(email: 'james@logi.cl')
    a.valid?

    b = Person.new(email: 'invalid')
    b.valid?

    puts a.errors.to_a.inspect
    puts b.errors.to_a.inspect
    """
    When I run `ruby active_record_validation.rb`
    Then it should pass with:
    """
    []
    ["Email is invalid"]
    """

    Examples:
      | Macro                         |
      | validates :email, email: true |
      | validates_as_email :email     |
