Rails.application.routes.draw do
  resources :pet_requests, path: 'pet-requests'

  root 'sessions#index'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/auth/sign-out', to: 'sessions#destroy', as: :sign_out
end
