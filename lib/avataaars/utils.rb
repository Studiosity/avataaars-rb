# frozen_string_literal: true

class Avataaars
  #
  # Utility class for Avataaars helper methods
  #
  class Utils
    #
    # Deep transform the keys in an object (Hash/Array)
    #
    # Copied from active support
    # @see active_support/core_ext/hash/keys.rb
    #
    def self.deep_transform_keys_in_object(object, &block)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), result|
          result[yield(key)] = deep_transform_keys_in_object(value, &block)
        end
      when Array
        object.map { |e| deep_transform_keys_in_object(e, &block) }
      else
        object
      end
    end

    #
    # Recursively normalizes hash objects with camelized string keys
    #
    def self.normalize_object(object)
      deep_transform_keys_in_object(object) { |k| normalize_key(k) }
    end

    #
    # Normalizes hash keys into camelized strings
    #
    # Regex sourced from ActiveSupport camelize
    #
    def self.normalize_key(key)
      key.to_s.downcase.gsub(%r{(?:_|(/))([a-z\d]*)}) do
        "#{Regexp.last_match(1)}#{Regexp.last_match(2).capitalize}"
      end
    end
    private_class_method :normalize_key
  end
end
