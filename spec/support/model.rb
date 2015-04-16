class Model
  include ActiveModel::Validations

  attr_accessor :attributes

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def email=(email)
    @attributes[:email] = email
  end
end

class Person < Model
  validates :email, email: true
end
