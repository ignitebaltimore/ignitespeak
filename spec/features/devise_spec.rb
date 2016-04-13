require "spec_helper"
require 'support/basic_authentication'
require 'database_cleaner'
include Warden::Test::Helpers
Warden.test_mode!

describe "omniauth authentication", :type => :feature do

  context "with an invalid email address and password", :js => true, :type => :controller do
    it "should be redirected to sign in page" do
      visit rails_admin.dashboard_path
      page.find(:xpath,"//*[text()='#{"Log in"}']").click
      expect(page).to have_content 'Forgot your password'
    end
  end

  context "with a valid email address and password", :js => true, :type => :controller do
    it "should be redirected to admin page" do
   #   ad = Admin.create!(:nickname => "A nick" ,:email => "nick@email.com", :password => "123456789")
   #   ad.save!

      admin = FactoryGirl.create(:admin)
      login_as(admin, :scope => :admin)
      
      visit rails_admin.dashboard_path

      expect(page).to have_content 'Site Administration'

    end
  end 

end
