require "spec_helper"

feature do
  let(:proposal) { create(:proposal) }

  it "Users can delete proposals" do
    visit proposal_url(proposal)
    click_button "Delete Proposal"
    should_load "/"
    expect(Proposal.count).to eq(0)
    expect(Dom::Flash::Success.all).not_to be_empty
  end
end
