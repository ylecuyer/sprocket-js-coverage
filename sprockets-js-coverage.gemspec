# frozen_string_literal: true

require_relative "lib/sprockets/js/coverage/version"

Gem::Specification.new do |spec|
  spec.name = "sprockets-js-coverage"
  spec.version = Sprockets::Js::Coverage::VERSION
  spec.authors = ["Yoann Lecuyer"]
  spec.email = ["yoann.lecuyer@gmail.com"]

  spec.summary = "Add coverage to your JavaScript files"
  spec.description = "Adds a sprocket compiler to add coverage to your JavaScript files"
  spec.homepage = "https://github.com/ylecuyer/sprockets-js-coverage"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.files = []
  spec.files += Dir["lib/**/*"]
  spec.files << "js/instrumenter/dist/main.js"
  spec.files << "CHANGELOG.md"
  spec.files << "README.md"
  spec.files << "LICENSE"

  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "sprockets"
  spec.add_dependency "mini_racer"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
