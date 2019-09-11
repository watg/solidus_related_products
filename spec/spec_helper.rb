# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('dummy/config/environment.rb', __dir__)

require 'solidus_support/extension/feature_helper'

require 'rspec-activemodel-mocks'

require 'spree/testing_support/controller_requests'
require 'spree/api/testing_support/helpers'
require 'spree/api/testing_support/setup'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

FactoryBot.find_definitions

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.example_status_persistence_file_path = './spec/examples.txt'

  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::Api::TestingSupport::Helpers, type: :controller
  config.extend Spree::Api::TestingSupport::Setup, type: :controller
end
