Rails.application.routes.draw do
  root "home#index"

  resources :about, only: :index
  resources :gifs, only: [:new, :create]
end
