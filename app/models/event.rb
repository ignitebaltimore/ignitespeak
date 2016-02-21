class Event < ActiveRecord::Base
 belongs_to :proposal


 validates_presence_of :title,  allow_blank: false
 validates :title,length: { maximum: 254 }

 rails_admin do
   #show only these fields for the event
   list do
    field :title
    field :time
    field :tickets 
   end
 end
end
