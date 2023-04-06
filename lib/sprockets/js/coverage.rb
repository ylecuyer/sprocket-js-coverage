# frozen_string_literal: true

require_relative "coverage/version"
require_relative "coverage/configuration"

module Sprockets
  module Js
    module Coverage
      class Error < StandardError; end

      class << self
        def configure
          yield config
        end

        def config
          @config ||= Configuration.new
        end
      end
    end
  end
end
