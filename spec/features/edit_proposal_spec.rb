require "spec_helper"

feature do
  let(:proposal) { create(:proposal,title: "This is the old title") }

  it "Users can edit a previously-submitted proposal" do
    visit edit_proposal_url(proposal)
    fill_in "proposal[title]", with: "A brand-new title"
    click_button "Save"
    expect(Dom::Proposal.find_by_title("A brand-new title")).to be_present
    expect(Dom::Flash::Success.first).to be_present
  end

  it "Users see an error page when they update invalid data" do
    visit edit_proposal_url(proposal)
    fill_in "proposal[title]", with: ""
    click_button "Save"
    expect(Dom::Flash::Error.first).to be_present
  end
end
