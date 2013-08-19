require "spec_helper"

describe do
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

    ActionMailer::Base.deliveries.size.should == 0
    Proposal.count.should == 0
    click_button "Save Proposal"
    ActionMailer::Base.deliveries.size.should == 1
    Proposal.count.should == 1

    Dom::Flash::Success.all.should_not be_empty
    proposal = Dom::Proposal.find_by_title(title)
    proposal.should_not be_nil
    proposal.speakername.should == speaker_name
    proposal.description.should == description
    proposal.email.should == email
    proposal.bio.should == bio
    email = ActionMailer::Base.deliveries.last
    email.subject.should =~ /Thank you/i
    email.body.should =~ /#{proposal_path(id: Proposal.first.hash_code)}/
  end

  it "Users see validation errors when submitting incorrect proposals" do
    visit "/"
    click_button "Save Proposal"
    Dom::Flash::Error.all.should_not be_empty
    Proposal.count.should == 0
  end
end
