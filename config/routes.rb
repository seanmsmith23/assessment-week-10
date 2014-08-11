Rails.application.routes.draw do
  root "home#index"

  resources :about, only: :index
end
