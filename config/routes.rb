Rails.application.routes.draw do
  # get 'categories/show'
  # get 'products/index'
  # get 'products/show'

  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
