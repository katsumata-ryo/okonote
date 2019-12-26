Rails.application.routes.draw do
  root :to => 'accounts#index'
  resources :account_sessions
  resources :accounts

  get 'login' => 'account_sessions#new', :as => :login
  post 'logout' => 'account_sessions#destroy', :as => :logout
end
