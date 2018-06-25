Rails.application.routes.draw do
  root "cards#index"
  resources :cards
  resources :ideas

  resources :users, only: [:new, :create, :show]
end
