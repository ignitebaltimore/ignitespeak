Ignitespeak::Application.routes.draw do
  # for authentication using social network
  devise_for :admins, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

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
