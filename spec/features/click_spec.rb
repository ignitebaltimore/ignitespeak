require "spec_helper"
require "rails_helper"

require 'support/basic_authentication'

describe "test event model", :type => :feature do
  include_context 'basic authentication'
  context "with authentication on", :js => true, :type => :controller do
    before(:each) do
      # always login before accessing the admin page
      http_basic_authentication
    end

  it "access the admin page" do
   visit rails_admin.dashboard_path
   expect(current_path).to eq rails_admin.dashboard_path 
  end
 end

 context "with admin reached", :js => true, :type => :controller do
    before(:each) do
      # always login before accessing the admin page
      http_basic_authentication
    end

   it "should have event" do
    visit rails_admin.dashboard_path
    page.find('[data-model=event] a').click
    # if we are in the event model then should have Events somewhere
    expect(page.find('[data-model=event]')).to have_content('Events')
  end
 end

 context "with admin reached", :js => true, :type => :controller do
    before(:each) do
      # always login before accessing the admin page
      http_basic_authentication
    end
    it "should have the load event button" do
     visit rails_admin.dashboard_path
     page.find('[data-model=event] a').click
     # should have the Load button in the events tab
     # Either
     page.find(:xpath,"//*[text()='#{"Load"}']")
     # Or
     page.find(:xpath,"//span[text()='Load']")
  end
 end

 context "with an empty proposal database", :js => true, :type => :controller do
    before(:each) do
      # always login before accessing the admin page
      http_basic_authentication
    end
    it "should have an empty events database after the the load button is pressed" do
     visit rails_admin.dashboard_path
     page.find('[data-model=event] a').click
     page.find(:xpath,"//*[text()='#{"Load"}']").click
     expect(Event.count).to be == 0
  end
 end
end
