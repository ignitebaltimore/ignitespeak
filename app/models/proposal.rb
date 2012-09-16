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
#  selected     :boolean          default(FALSE), not null
#  position     :integer          default(0), not null
#

require "digest/sha2"

class Proposal < ActiveRecord::Base
  attr_accessible :bio, :description, :email, :phone, :title, :website, :speaker_name
  validates_presence_of :title, :description, :email, :bio, :speaker_name, allow_blank: false
  validates :description, length: { maximum: 1000 }
  validates :bio, length: { maximum: 100 }
  validates :speaker_name, :title, :email, :phone, :website, length: { maximum: 254 }

  before_create :save_hash_code

  default_scope order(:position)
  scope :selected, where(selected: true)

  def to_param
    persisted? ? hash_code : nil
  end

  private

  def save_hash_code
    self.hash_code = Digest::SHA2.hexdigest("#{title} #{Time.now.to_s} + #{rand}").to_s.first(10)
  end
end
