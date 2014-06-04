require "spec_helper"

feature "View selected proposals" do
  let!(:accepted_b) { create(:proposal,:selected,title: "B",position: 2) }
  let!(:accepted_a) { create(:proposal,:selected,title: "A",position: 1) }
  let!(:unaccepted) { create(:proposal,title: "C") }

  it "shows correct proposals in order" do
    visit selected_proposals_path
    expect(Dom::Proposal.count).to eq(2)
    expect(Dom::Proposal.all.map { |p| p.title[0] }).to eq(%w(A B))
  end
end
