Rails.application.routes.draw do
  # get 'dashboard/index'
  devise_for :users
  resources :users  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :inventory_items, only: [:index, :show] # Add other routes as needed
  root 'dashboard#index'
  resources :products
  resources :orders
  get '/products/low_stock', to: 'products#low_stock'
  get '/low_stock_products', to: 'products#low_stock_products', as: 'low_stock_products'
  # get '/manage_inventory', to: 'inventory#manage', as: 'manage_inventory'
  resources :customers

end
