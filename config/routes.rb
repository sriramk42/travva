Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :trip_items, only: :create
  end

  resources :trip_items, only: [:destroy, :update]

  resources :items do
    resources :trip_items, only: [:create, :destroy]
  end
  get 'suggestions', to: 'items#suggestions', as: :suggestions
end
