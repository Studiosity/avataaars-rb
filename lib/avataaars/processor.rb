# frozen_string_literal: true

require 'json'
require 'open3'

class Avataaars
  #
  # Processor helper class for calling out to Avataaars NodeJS library
  #
  # Heavily based on the Schmooze library https://github.com/Shopify/schmooze
  #
  class Processor
    def initialize(app_root)
      @app_root = app_root
    end

    def create_avatar(options)
      puts "O: #{options}"

      spawn_process
      ensure_packages_are_initiated
      call_js_method options
    ensure
      cleanup_process if stdin
    end

    private

    attr_reader :app_root, :stdin, :stdout, :stderr, :wait_thr

    def spawn_process
      @stdin, @stdout, @stderr, @wait_thr = Open3.popen3(
        'node',
        File.expand_path(File.join(__dir__, 'js/processor.js')),
        chdir: app_root
      )
    end

    def ensure_packages_are_initiated
      input = stdout.gets
      raise Avataaars::Error, "Failed to instantiate worker process:\n#{stderr.read}" if input.nil?

      result = JSON.parse(input)
      return if result[0] == 'ok'

      cleanup_process
      parse_package_error result[1]
    end

    def parse_package_error(error_message) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      package_name = error_message[/^Error: Cannot find module '(.*)'$/, 1]
      raise Avataaars::Error, error_message unless package_name

      begin
        %w[dependencies devDependencies].each do |key|
          next unless package_json.key?(key) && package_json[key].key?(package_name)

          raise Avataaars::DependencyError, Utils.squish(<<~ERROR)
            Cannot find module '#{package_name}'.
            The module was found in '#{package_json_path}' however, please run 'npm install' from '#{app_root}'
          ERROR
        end
      rescue Errno::ENOENT # rubocop:disable Lint/SuppressedException
      end
      raise Avataaars::DependencyError, Utils.squish(<<~ERROR)
        Cannot find module '#{package_name}'. You need to add it to '#{package_json_path}' and run 'npm install'
      ERROR
    end

    def package_json_path
      @package_json_path ||= File.join(app_root, 'package.json')
    end

    def package_json
      @package_json ||= JSON.parse(File.read(package_json_path))
    end

    def call_js_method(options) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      stdin.puts JSON.dump([options])
      input = stdout.gets
      raise Errno::EPIPE, "Can't read from worker" if input.nil?

      status, message, error_class = JSON.parse(input)

      if status == 'ok'
        message
      elsif error_class.nil?
        raise Avataaars::JavaScript::UnknownError, message
      else
        raise Avataaars::JavaScript.const_get(error_class, false), message
      end
    rescue Errno::EPIPE, IOError
      raise Avataaars::Error, "Worker process failed:\n#{stderr.read}"
    end

    def cleanup_process
      stdin.close
      stdout.close
      stderr.close
      wait_thr.join
    end
  end
end
