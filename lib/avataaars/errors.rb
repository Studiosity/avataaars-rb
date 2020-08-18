# frozen_string_literal: true

class Avataaars
  #
  # Error classes for calling out to Avataaars NodeJS library
  #
  # Heavily based on the Schmooze library https://github.com/Shopify/schmooze
  #
  Error = Class.new(StandardError)
  DependencyError = Class.new(Error)
  module JavaScript # rubocop:disable Style/Documentation
    Error = Class.new(::Avataaars::Error)
    UnknownError = Class.new(Error)
    def self.const_missing(name)
      const_set name, Class.new(Error)
    end
  end
end
