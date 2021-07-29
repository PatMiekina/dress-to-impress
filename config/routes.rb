Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dresses
  resources :bookings
  resources :dresses do
    resources :reviews, except: [:destroy]
  end
  resources :reviews, only: [:destroy]
end
