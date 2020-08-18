# frozen_string_literal: true

require 'avataaars/version'

require 'avataaars/errors'
require 'avataaars/processor'
require 'avataaars/utils'

#
# Avataaars interface for creating avatar SVGs from feature traits
#
class Avataaars
  #
  # @param [Hash] options Optional parameters to pass to avatar processor
  #   see https://github.com/fangpenlin/avataaars
  #
  def initialize(options = {})
    @root_path = options.delete :root_path
    @options = options
  end

  #
  # Call to avatar creation processor and return rendered SVG
  #
  # @return [String] The resulting SVG data
  #
  def create_avatar
    normalised_options = Utils.normalize_object(@options)
    processor.create_avatar normalised_options
  end

  private

  def root_path
    @root_path ||= Dir.pwd
  end

  def processor
    Processor.new(root_path)
  end
end
