Rails.application.routes.draw do
  root to: 'static#home'

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  get 'auth', to: 'sessions#auth'
  resources :sessions, only: [:create]
end
