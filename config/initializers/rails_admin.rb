# RailsAdmin config file. Generated on January 22, 2013 16:54
# See github.com/sferik/rails_admin for more informations

require Rails.root.join('lib', 'rails_admin_loadevent.rb')

RailsAdmin.config do |config|

#  # Load the class in lib/rails_admin_loadevent.rb
#  module RailsAdmin
#    module Config
#      module Actions
#        class Loadevent < RailsAdmin::Config::Actions::Base
#          RailsAdmin::Config::Actions.register(self)
#        end
#      end
#    end
#  end
#
  config.actions do
 # root actions
   dashboard                     # mandatory
 # collection actions
   index                         # mandatory
   new
   export
   history_index
   bulk_delete
 # member actions
   show
   edit
   delete
   history_show
   show_in_app

   loadevent do
    visible do
     bindings[:abstract_model].model == Event
    end
   end
  end


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Ignitespeak', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  #config.current_user_method { current_user } # auto-generated

  config.authenticate_with do
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV.fetch("ADMIN_USERNAME") && password == ENV.fetch("ADMIN_PASSWORD")
    end
  end

  # Other config stuff should go here
  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

   #Number of default rows per-page:
   config.default_items_per_page = 100

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Proposal']

  # Include specific models (exclude the others):
   config.included_models = ['Proposal', 'Event']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Proposal  ###

  # config.model 'Proposal' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your proposal.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer
  #     configure :speaker_name, :string
  #     configure :title, :string
  #     configure :description, :text
  #     configure :email, :string
  #     configure :phone, :string
  #     configure :bio, :text
  #     configure :website, :string
  #     configure :hash_code, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :selected, :boolean
  #     configure :position, :integer
  #     configure :filepicker_url, :string

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
