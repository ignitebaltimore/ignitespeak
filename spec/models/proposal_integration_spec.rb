require "spec_helper"

describe Proposal do
  context "at a certain time of day with a certain random seed" do
    before do
      Time.stub!(:now).and_return(Time.new(2012,7,3,9,25))
      srand(100)
    end

    it "creates a hash code upon creation" do
      proposal = build(:proposal,hash_code: nil,title: "A Tale of Two Cities")
      proposal.save!
      proposal.hash_code.should == "f6ee1a1f4d"
    end
  end

  context "database constraints" do
    it "should require unique hash codes" do
      first = create(:proposal,title: "A title")
      second = create(:proposal,title: "Another title")
      second.hash_code = first.hash_code
      expect { second.save! }.to raise_error
    end
  end

  context "with a set of selected, positioned speakers" do
    let!(:selected) do
      [create(:proposal,:selected,position: 2),
       create(:proposal,:selected,position: 1),
       create(:proposal,:selected,position: 3)]
    end

    before { create(:proposal,title: "Not picked :-(") }

    it "returns only the selected speakers, in order" do
      Proposal.selected.should eq(selected.sort_by(&:position))
    end
  end
end
