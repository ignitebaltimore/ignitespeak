require "spec_helper"

feature do
  let(:speaker_name) { "Heywood Jabuzzoff" }
  let(:title) { "Secrets of Archimedes" }
  let(:description) { "A look at the secrets of Archimedes" }
  let(:email) { "proposer@example.com" }
  let(:bio) { "I am an expert on Archimedes" }

  it "Users can submit Ignite proposals and receive confirmation emails" do
    visit "/"
    fill_in "proposal[speaker_name]", with: speaker_name
    fill_in "proposal[title]", with: title
    fill_in "proposal[description]", with: description
    fill_in "proposal[email]", with: email
    fill_in "proposal[bio]", with: bio

    expect(ActionMailer::Base.deliveries.size).to eq(0)
    expect(Proposal.count).to eq(0)
    click_button "Save Proposal"
    expect(ActionMailer::Base.deliveries.size).to eq(1)
    expect(Proposal.count).to eq(1)

    expect(Dom::Flash::Success.all).to be_present
    proposal = Dom::Proposal.find_by_title(title)
    expect(proposal).to be_present
    expect(proposal.speakername).to eq(speaker_name)
    expect(proposal.description).to eq(description)
    expect(proposal.email).to eq(email)
    expect(proposal.bio).to eq(bio)
    email = ActionMailer::Base.deliveries.last
    expect(email.subject).to match(/Thank you/i)
    expect(email.body).to match(/#{proposal_path(id: Proposal.first.hash_code)}/)
  end

  it "Users see validation errors when submitting incorrect proposals" do
    visit "/"
    click_button "Save Proposal"
    expect(Dom::Flash::Error.all).to be_present
    expect(Proposal.count).to eq(0)
  end
end
