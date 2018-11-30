# -*- encoding: utf-8 -*-
require 'mail'
require 'validate_as_email/blacklisted_prefixes'

module ActiveModel
  module Validations
    class EmailValidator < EachValidator
      attr_reader :record, :attribute, :value, :email, :parse

      def validate_each(record, attribute, value)
        @record, @attribute, @value = record, attribute, value

        @email = Mail::Address.new(value)
        @parse  = email.__send__(:parse, email.address)

        if valid?
          add_error(:prefix) if prefix_blacklisted?
        else
          add_error
        end
      rescue Mail::Field::ParseError
        add_error
      end

      private

      def valid?
        !!(domain_and_address_present? &&
           domain_has_more_than_one_atom? &&
           local_plus_domain_equals_to_value? &&
          !email_has_consecutive_dots?)
      end

      def domain_and_address_present?
        email.domain && email.address == value
      end

      def domain_has_more_than_one_atom?
        parse.domain.split('.').length > 1
      end

      def local_plus_domain_equals_to_value?
        parse.local + "@" + parse.domain == value
      end

      def email_has_consecutive_dots?
        email.address.match(/[.]{2,}/)
      end

      def add_error(error = :invalid)
        if message = options[:message]
          record.errors[attribute] << message
        else
          record.errors.add(attribute, error)
        end
      end

      def prefix_blacklisted?
        ValidateAsEmail::BlacklistedPrefixes.list.include?(local_base.downcase)
      end

      def local_base
        local = parse.local
        domain = parse.domain
        separator = '+'

        if domain == 'gmail.com'
          # Gmail ignores periods. If they signed up with periods initially, this won’t catch it
          local = local.delete('.')
        end

        local.gsub(/#{Regexp.escape(separator)}.*/, '')
      end
    end

    module HelperMethods
      def validates_as_email(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
