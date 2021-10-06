Rails.application.routes.draw do
  get 'carts/show'
  devise_for :users
  devise_for :admins
  # get 'categories/show'
  # get 'products/index'
  # get 'products/show'
  
  get '/search', to: "products#search"
  get '/admin/categories/search', to: 'categories#search'
  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resource :cart, only: %i[:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end
  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
