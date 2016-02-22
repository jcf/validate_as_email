require 'spec_helper'

describe ActiveModel::Validations::EmailValidator do
  describe '#validate' do
    [
      {
        desc: 'with a valid email address',
        validator: {},
        people: [
          {email: 'a@b.c'},
          {email: 'a+x@b.c'},
          {email: 'a@192.168.0.1'},
          {email: '1@1.com'}
        ],
        errors: []
      },
      {
        desc: 'with nil allowed',
        validator: {allow_nil: true},
        people: [ {email: nil} ],
        errors: []
      },
      {
        desc: 'with blank allowed',
        validator: {allow_blank: true},
        people: [ {email: ' '}, {email: "\t\n"} ],
        errors: []
      },
      {
        desc: 'with no message provided',
        validator: {},
        people: [ {email: 'invalid'}, {email: '  '} ],
        errors: ['Email is invalid']
      },
      {
        desc: 'with a custom error message',
        validator: {message: 'is kinda odd looking'},
        people: [ {email: 'invalid'}, {email: '  '} ],
        errors: ['Email is kinda odd looking']
      }
    ].each do |data|
      data[:people].each do |person_attributes|
        context data do
          let(:person) { Person.new(person_attributes) }

          let(:validator) do
            ActiveModel::Validations::EmailValidator.new(
              data[:validator].merge(attributes: [:email])
            )
          end

          before { validator.validate(person) }
          it { expect(person.errors.to_a).to eq(data[:errors]) }
        end
      end
    end
  end
end
