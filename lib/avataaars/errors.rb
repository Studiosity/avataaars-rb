# frozen_string_literal: true

class Avataaars
  #
  # Error classes for calling out to Avataaars NodeJS library
  #
  # Heavily based on the Schmooze library https://github.com/Shopify/schmooze
  #
  class Error < StandardError
  end

  class DependencyError < Error
  end

  module JavaScript # rubocop:disable Style/Documentation
    class Error < ::Avataaars::Error
    end

    class UnknownError < Error
    end

    def self.const_missing(name)
      const_set name, Class.new(Error)
    end
  end
end
