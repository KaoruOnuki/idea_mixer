Rails.application.routes.draw do
  root "cards#index"
  resources :cards
  resources :ideas
end
