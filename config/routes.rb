Ignitespeak::Application.routes.draw do
  resources :proposals do
    collection do
      get "closed"
      get "selected"
    end
  end

  root to: "proposals#new"
end
