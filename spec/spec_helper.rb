require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.mock_with :mocha
    config.around do |example|   # This will be run around all tests
      old_search_implementation = Searcher.search_implementation
      example.run
      Searcher.search_implementation = old_search_implementation
    end
  end
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end

