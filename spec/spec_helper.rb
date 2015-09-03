require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require "rubygems"

ENV["RAILS_ENV"] ||= 'test'
ENV["SECRET_TOKEN"] = "TEST123"
ENV["DEVISE_SECRET_KEY"] = "TEST_DEVISE_123"
require "rails/application"
# https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers/integrations/rspec'
require "factory_girl"
require 'capybara/rails'
require 'capybara/rspec'
require "subelsky_power_tools/page_load_assertions"
require "subelsky_power_tools/controller_shared_behavior"
require "pp"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include PageLoadTest, :type => :feature
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    GC.disable
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
