Ignitespeak::Application.routes.draw do
  resources :events
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :proposals do
    collection do
      get "closed"
      get "selected"
    end
  end

  root to: "proposals#new"
end
