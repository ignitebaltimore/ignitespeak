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

  pending "does not allow long bios"
  pending "does not allow long descriptions"
end
