Feature: ActiveModel validation

  Scenario Outline: Validation via <Macro>
    Given a file named "active_model_validation.rb" with:
    """
    require 'active_model'
    require 'validate_as_email'

    class Person
      include ActiveModel::Validations

      <Macro>

      attr_accessor :email

      def initialize(email)
        @email = email
      end
    end

    a = Person.new('james@logi.cl')
    a.valid?

    b = Person.new('invalid')
    b.valid?

    puts a.errors.to_a.inspect
    puts b.errors.to_a.inspect
    """
    When I run `ruby active_model_validation.rb`
    Then it should pass with:
    """
    []
    ["Email is invalid"]
    """

    Examples:
      | Macro                         |
      | validates :email, email: true |
      | validates_as_email :email     |
