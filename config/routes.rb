Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :trip_items, only: [:create, :destroy]
  end

  resources :items do
    resources :trip_items, only: [:create, :destroy]
  end
end
