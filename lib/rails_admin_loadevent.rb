require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
 
module RailsAdminLoadevent
end
 
module RailsAdmin
  module Config
    module Actions
      class Loadevent < RailsAdmin::Config::Actions::Base
	RailsAdmin::Config::Actions.register(self) 
        register_instance_option :collection do
          true
        end
        register_instance_option :link_icon do
          'icon-fire'
        end 
        #disable jquery pjax
        register_instance_option :pjax? do
          false
        end
        register_instance_option :controller do
          Proc.new do
	    # find all the selected and archived records
            allSelectedEvents = Proposal.where(selected: "t", archived: "f" ).select("title", "id")
	    # if records nil do no contnue
            unless allSelectedEvents.nil?
             allSelectedEvents.each { |eachEvent|
	       #if records already exist
              unless Event.exists?(eachEvent.attributes)
                tempAttributes = eachEvent.attributes
                tempAttributes[:time] = ""
                puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
                tempAttributes.each do |key, array|
                  puts key
                end
		recordEvent = Event.create(tempAttributes)
                if recordEvent.valid?
		  recordEvent.save
		end
               end
             }
            end
            redirect_to back_or_index
          end
        end
      end
    end
  end
end
