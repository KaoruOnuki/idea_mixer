Rails.application.routes.draw do
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]

  root "cards#index"
  resources :cards
  resources :ideas

  resources :users
  resources :likes, only: [:create, :destroy]
end
