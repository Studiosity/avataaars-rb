# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'avataaars/version'

Gem::Specification.new do |spec|
  spec.name        = 'avataaars'
  spec.version     = Avataaars::VERSION
  spec.required_ruby_version = ['>= 3.2.0', '< 4.1.0']
  spec.authors     = ['Andrew Bromwich']
  spec.email       = %w[abromwich@studiosity.com]
  spec.description = 'Ruby wrapper library to call to avataaars React component using NodeJS'
  spec.summary     = <<~SUMMARY.delete("\n")
    A Ruby gem to transform attributes into avatar SVGs using the React avataaars library through NodeJS
  SUMMARY
  spec.homepage    = 'https://github.com/Studiosity/avataaars-rb'
  spec.license     = 'MIT'

  spec.files         = `git ls-files lib`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
