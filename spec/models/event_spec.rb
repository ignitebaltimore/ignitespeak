require "spec_helper"

RSpec.describe Event do
	let(:event) do
		Event.new(
			title: 'Ignite'
		)
	end

	it "is validate with all the required fields" do 
		expect(event).to be_valid
  	end

  	it 'is invalid without a title' do
  		event.title = nil
  		expect(event).to be_invalid
  	end

  	it "is valid with a title"  do
  		expect(event).to be_valid
  	end
end

		











# Test is should just make it(model) is written correctly 
# First line is printing out what it will read back at you
# Second line is defining the variable 
# Third line is saying what is needed to be validated
# Fourth line is saying what the first line is saying but in pure code