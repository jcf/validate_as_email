# -*- encoding: utf-8 -*-
require 'mail'

module ActiveModel
  module Validations
    class EmailValidator < EachValidator
      attr_reader :record, :attribute, :value, :email, :tree

      def validate_each(record, attribute, value)
        @record, @attribute, @value = record, attribute, value

        @email = Mail::Address.new(value)
        @tree  = email.__send__(:tree)

        add_error unless valid?
      rescue Mail::Field::ParseError
        add_error
      end

      private

      def valid?
        !!(domain_and_address_present? && domain_has_more_than_one_atom?)
      end

      def domain_and_address_present?
        email.domain && email.address == value
      end

      def domain_has_more_than_one_atom?
        tree.domain.dot_atom_text.elements.length > 1
      end

      def add_error
        if message = options[:message]
          record.errors[attribute] << message
        else
          record.errors.add(attribute, :invalid)
        end
      end
    end

    module HelperMethods
      def validates_as_email(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
