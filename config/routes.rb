Ignitespeak::Application.routes.draw do
  resources :proposals
  root to: "proposals#new"
end
