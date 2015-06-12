Rails.application.routes.draw do
  root 'pet_requests#index'
  resources :pet_requests, path: 'pet-requests', except: [:show]

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/auth/sign-out', to: 'sessions#destroy', as: :sign_out
end
