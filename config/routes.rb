Rails.application.routes.draw do
  root to: 'static#home'

  resources :users, only: [:new, :create]
end
