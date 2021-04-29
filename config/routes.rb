Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :paintings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy]
end
