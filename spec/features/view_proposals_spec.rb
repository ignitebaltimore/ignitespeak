require "spec_helper"

describe "View selected proposals" do
  let!(:accepted_b) { create(:proposal,:selected,title: "B",position: 2) }
  let!(:accepted_a) { create(:proposal,:selected,title: "A",position: 1) }
  let!(:unaccepted) { create(:proposal,title: "C") }

  it "shows correct proposals in order" do
    visit selected_proposals_path
    Dom::Proposal.count.should eq(2)
    Dom::Proposal.all.map(&:title).should eq(%w(A B))
  end
end
