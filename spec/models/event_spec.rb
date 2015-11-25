require "spec_helper"


RSpec.describe Event do
	it "is validate with all the required fields" do 
		event = Event.new(
			title: 'Ignite'
			)
		expect(event).to be_valid
  	end
end

	



# Test is should just make it(model) is written correctly 
# First line is printing out what it will read back at you
# Second line is defining the variable 
# Third line is saying what is needed to be validated
# Fourth line is saying what the first line is saying but in pure code