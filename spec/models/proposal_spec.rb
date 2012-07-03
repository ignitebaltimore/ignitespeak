# == Schema Information
#
# Table name: proposals
#
#  id           :integer          not null, primary key
#  speaker_name :string(255)      not null
#  title        :string(255)      not null
#  description  :text             not null
#  email        :string(255)      not null
#  phone        :string(255)
#  bio          :text             not null
#  website      :string(255)
#  hash_code    :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Proposal do
  it "creates a hash code upon creation" do
    proposal = build(:proposal,hash_code: nil,title: "A Tale of Two Cities")
    proposal.save!
    proposal.hash_code.should == "0c71da6154"
  end

  it { should ensure_length_of(:speaker_name).is_at_most(254) }
  it { should ensure_length_of(:title).is_at_most(254) }
  it { should ensure_length_of(:email).is_at_most(254) }
  it { should ensure_length_of(:phone).is_at_most(254) }
  it { should ensure_length_of(:website).is_at_most(254) }
  it { should ensure_length_of(:description).is_at_most(1000) }
  it { should ensure_length_of(:bio).is_at_most(100) }
end
