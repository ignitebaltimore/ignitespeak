require "spec_helper"

describe do
  let(:proposal) { create(:proposal,title: "This is the old title") }

  it "Users can edit a previously-submitted proposal" do
    visit edit_proposal_url(proposal)
    fill_in "proposal[title]", with: "A brand-new title"
    click_button "Save"
    Dom::Proposal.find_by_title("A brand-new title").should_not be_nil
    Dom::Flash::Success.first.should_not be_nil
  end

  it "Users see an error page when they update invalid data" do
    visit edit_proposal_url(proposal)
    fill_in "proposal[title]", with: ""
    click_button "Save"
    Dom::Flash::Error.first.should_not be_nil
  end
end
