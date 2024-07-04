Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'dashboard#index'

  resources :inventory_items
  resources :orders

  get 'dashboard', to: 'dashboard#index'
end
