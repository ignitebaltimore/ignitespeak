require "rubygems"
require "spork"

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require "rails/application"
  # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  Spork.trap_method(Rails::Application, :reload_routes!)
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
    config.include PageLoadAssertions, :type => :request

    config.mock_with :rspec
    config.use_transactional_fixtures = false

    last_gc_run = Time.now

    config.before :suite do
      DatabaseCleaner.clean_with :truncation
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      GC.disable
    end

    config.before(:each,:type => :request) do
      DatabaseCleaner.start
    end

    config.after(:each,:type => :request) do
      DatabaseCleaner.clean
    end

    config.after(:each) do
      if Time.now - last_gc_run > 2.0
        GC.enable
        GC.start
        last_gc_run = Time.now
      end
    end
  end

  require 'rspec/expectations'
  require 'mime/types'
end

Spork.each_run do
  FactoryGirl.definition_file_paths = [
    File.join(Rails.root, 'spec', 'factories')
  ]

  FactoryGirl.find_definitions
  load "spec/support/dominos.rb"
end
