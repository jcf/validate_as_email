# Adds a custom matcher to RSpec to make it easier to make sure your email
# column is valid.
#
#   class Person
#     include ActiveModel::Validations
#
#     validates_as_email :email
#
#     def initialize(attributes = {})
#       @attributes = attributes
#     end
#
#     def email
#       @attributes[:email]
#     end
#
#     def email=(address)
#       @attributes[:email] = address
#     end
#   end
#
#   describe Person
#     it { should have_a_valid_email_address_for(:email) }
#   end
RSpec::Matchers.define(:have_a_valid_email_address_for) do |column_name|
  match do |klass|
    %w(
      matz@example.com
      a@b.tld
      1@8.8.8.8
    ).each do |valid|
      klass.send("#{column_name}=", valid)
      klass.should have(0).errors_on(column_name)
    end

    %w(
      word
      a@
      @b
      example.com
      8.8.8.8
      admin@gmail.com
      mark@abcmail.email
    ).each do |invalid|
      klass.send("#{column_name}=", invalid)
      klass.should have(1).error_on(column_name)
    end
  end
end
