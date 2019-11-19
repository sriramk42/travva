Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips, only: [:index, :show, :new, :create] do
    resources :trip_items, only: [:new, :create]
  end

  resources :items, only: [:index, :show, :new, :create] do
    resources :trip_items, only: [:new, :create]
  end
end
