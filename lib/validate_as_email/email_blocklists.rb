# frozen_string_literal: true

module ValidateAsEmail
  module EmailBlocklists
    module_function

    def domain_list
      @domain_list ||= load_email_blocklist('blocked_domains.txt')
    end

    def local_part_list
      @local_part_list ||= load_email_blocklist('blocked_local_parts.txt')
    end

    def address_list
      @address_list ||= load_email_blocklist('blocked_addresses.txt')
    end

    def regex_list
      @regex_list ||= load_email_blocklist('blocked_regexes.txt')
    end

    def load_email_blocklist(list)
      file_path = File.expand_path('../../../config/email_blocklists/data/global',  __FILE__)
      data = File.read("#{file_path}/#{list}")
      data.split("\n")
    end
    private_class_method :load_email_blocklist
  end
end
