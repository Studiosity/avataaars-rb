# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'avataaars'

require 'mini_magick'

RSpec.configure do |config|
  config.order = 'random'
end
