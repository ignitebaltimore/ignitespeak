require "spec_helper"

describe do
  let(:proposal) { create(:proposal) }

  it "Users can delete proposals" do
    visit proposal_url(proposal)
    click_button "Delete This Proposal"
    should_load "/"
    Proposal.count.should == 0
    Dom::Flash::Success.all.should_not be_empty
  end
end
