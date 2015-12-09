class Event < ActiveRecord::Base
	validates :title, presence: true
end 