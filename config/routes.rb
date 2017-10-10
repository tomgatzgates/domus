Rails.application.routes.draw do
  root to: 'static#home'

  get 'login', to: 'sessions#new'
  get 'auth', to: 'sessions#auth'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  get 'register', to: 'users#new'
  resources :users, only: [:create]
  get 'account', to: 'users#show'
  namespace :account do
    resources :properties, only: [:index, :new, :create, :show]
  end
end
