require "spec_helper"
require "rails_helper"
require 'support/basic_authentication'

describe "omniauth authentication", :type => :feature do
 describe "with authentication on", :js => true, :type => :controller do
   it "twitter sign in button should get to the admin page" do
     visit rails_admin.dashboard_path
     click_link "Sign in with Twitter"
#     puts page.body
     expect(page).to have_content 'Site Administration'
   end

   it "google sign in button should get to the admin page" do
     visit rails_admin.dashboard_path
     click_link "Sign in with Google"
#     puts page.body
     expect(page).to have_content 'Site Administration'
   end

#  include_context 'basic authentication'
#  it "access the admin page" do
#   # go to the admin page 
#   visit rails_admin.dashboard_path
#   # login to the admin page
#   http_basic_authentication
#   # verify if the admin page has been reached
#   expect(current_path).to eq rails_admin.dashboard_path 
#  end
 end
end
