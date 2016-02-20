require 'rails_helper'

RSpec.describe EventsController, type: :controller do
    context "with new title being filled and created" do
     it "the count should increase by one" do
      expect { 
       post :create, :event => {:title => "testing" }
      }.to change {Event.count}.by(1) 
     end
    end

    context "with not a title field being filled and created" do
     it "the count should remain the same" do
      expect { 
       post :create, :event => {:tickets => "hello/world" }
      }.to_not change {Event.count} 
     end
    end


end

