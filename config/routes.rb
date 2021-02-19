Rails.application.routes.draw do
  root 'categories#index'
  resources :users 
  resources :categories
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
