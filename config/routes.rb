Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users
  resources :paintings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
