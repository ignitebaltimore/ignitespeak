require "spec_helper"
require 'support/basic_authentication'

require 'database_cleaner'


describe "omniauth authentication", :type => :feature do
 describe "with authentication on", :js => true, :type => :controller do
   it "twitter sign in button should get to the admin page", :strategy => :truncation do
     # get the omniauth hash
     mock_twitter_authorized
  
     # create an admin user
     ad = Admin.create!(:nickname => "Alas", :email =>"alas@twitter.com", :password => "1234567890")
     ad.save!

     visit rails_admin.dashboard_path
     click_link "Sign in with Twitter"
     expect(page).to have_content 'Site Administration'
   end

   it "twitter sign in button should redirect to proposal form", :strategy => :truncation do
     # get the omniauth hash   
     mock_twitter_unauthorized  
 
     # create an admin user
     ad = Admin.create!(:nickname => "Alas", :email =>"alas@twitter.com", :password => "1234567890")
     ad.save!

     visit rails_admin.dashboard_path
     click_link "Sign in with Twitter"
     expect(page).to have_content 'Your email address'
   end

   it "twitter sign in button should fail if database is empty" do
     # get the omniauth hash
     mock_google_unauthorized  

     visit rails_admin.dashboard_path
     click_link "Sign in with Twitter"
     expect(page).to have_content 'Your email address'
   end

   it "google sign in button should get to the admin page" do
     # get the omniauth hash
     mock_google_authorized  

     ad = Admin.create!(:nickname => "", :email =>"alas@gmail.com", :password => "1234567890")
     ad.save!

     visit rails_admin.dashboard_path
     click_link "Sign in with Google"
     expect(page).to have_content 'Site Administration'
   end


   it "google sign in button should redirect to proposal form i.e. fail if email is wrong" do
     # get the omniauth hash
     mock_google_unauthorized  

     ad = Admin.create!(:nickname => "Alas", :email =>"alas@gmail.com", :password => "1234567890")
     ad.save!

     visit rails_admin.dashboard_path
     click_link "Sign in with Google"
     expect(page).to have_content 'Your email address'
   end

   it "google sign in button should fail if database is empty" do
     # get the omniauth hash
     mock_google_unauthorized  

     visit rails_admin.dashboard_path
     click_link "Sign in with Google"
     expect(page).to have_content 'Your email address'
   end



 end

end
