Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :dresses, except: [:destroy]
  end
  resources :dresses, only: [:destroy]
  resources :bookings
  resources :dresses do
    resources :reviews, except: [:destroy]
  end
  resources :reviews, only: [:destroy]
  get '/about', to: 'pages#about'
  get '/my-dresses', to: 'dresses#my_dresses'
  get '/booking-requests', to: 'bookings#/booking_requests'
end
