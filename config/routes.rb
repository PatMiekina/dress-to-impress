Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :dresses, except: [:destroy]
  end
  resources :dresses do
    resources :bookings, only: [:new, :edit, :create, :update]
    resources :reviews, only: [:new, :edit, :create, :update]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
  get '/about', to: 'pages#about', as: :about
  get '/my-dresses', to: 'dresses#my_dresses', as: :my_dresses
  get '/my-bookings', to: 'bookings#my_bookings', as: :my_bookings
  get '/booking-requests', to: 'bookings#booking_requests', as: :booking_requests
end
