require 'uri'

module Sprockets
  module Js
    module Coverage
      class Processor
        VERSION = '1'

        class << self
          def configure
            yield config
          end

          def config
            @config ||= Configuration.new
          end

          def cache_key
            @cache_key ||= "#{name}:#{VERSION}".freeze
          end

          def call(input)
            source = input[:data]
            uri = URI.parse(input[:uri])

            if Sprockets::Js::Coverage::Processor.config.should_process
              return unless Sprockets::Js::Coverage::Processor.config.should_process.call(uri.path)
            end

            begin
              covered_source = $context.call("instrument", source, uri.path.to_s)
            rescue => e
              warn "Error instrumenting #{uri.path}: #{e}"
              return source
            end
            covered_source
          end
        end
      end
    end
  end
end
