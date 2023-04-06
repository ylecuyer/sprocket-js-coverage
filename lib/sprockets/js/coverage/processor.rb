require 'uri'
require 'open3'

module Sprockets
  module Js
    module Coverage
      class Processor
        VERSION = '1'

        def self.cache_key
          @cache_key ||= "#{name}:#{VERSION}".freeze
        end

        def self.call(input)
          source = input[:data]

          uri = URI.parse(input[:uri])

          s = Time.now

          puts "===> #{uri.path}"
          stdin, stdout, stderr, wait_thr = Open3.popen3("nyc-stdin-instrumenter #{uri.path}")

          stdin.write source
          stdin.close

          covered_source = stdout.read
          stdout.close

          error_msg = stderr.read
          unless error_msg.blank?
            puts "Error: #{uri.path}"
            puts error_msg
          end

          stderr.close

          elapsed = Time.now - s
          puts "Took: #{elapsed}s for #{uri.path}"

          covered_source
        end
      end
    end
  end
end
