require "spec_helper"
require "rails_helper"
require 'support/basic_authentication'

describe "test authentication", :type => :feature do
 describe "with authentication on", :js => true, :type => :controller do
  include_context 'basic authentication'
  it "access the admin page" do
   # go to the admin page 
   visit rails_admin.dashboard_path
   # login to the admin page
   http_basic_authentication
   # verify if the admin page has been reached
   expect(current_path).to eq rails_admin.dashboard_path 
  end
 end
end
