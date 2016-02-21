require "spec_helper"
require "rails_helper"
require "capybara/rspec"
require 'capybara'
require 'capybara/dsl'


RSpec.shared_context 'basic authentication' do
  def encoded_username_password
    username = ENV.fetch('ADMIN_USERNAME')
    password = ENV.fetch('ADMIN_PASSWORD')

    ActionController::HttpAuthentication::Basic
     .encode_credentials(username, password)
  end

  def http_basic_authentication
    page.driver.header 'Authorization', encoded_username_password
    request.env['HTTP_AUTHORIZATION'] = encoded_username_password
  end

end
