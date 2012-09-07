Ignitespeak::Application.routes.draw do
  resources :proposals do
    get "closed", on: :collection
  end

  root to: "proposals#new"
end
