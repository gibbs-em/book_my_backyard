Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens do
    resources :bookings, only: :create
  end
  resources :bookings, except: :create do
    resources :reviews, except: :index
  end
end
