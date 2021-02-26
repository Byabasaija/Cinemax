Rails.application.routes.draw do
  get 'votes/create'
  get 'votes/destroy'
  root 'categories#index'
  resources :users, only: [:new, :create, :show, :destroy] 
  resources :categories, only: [:index, :new, :create, :show]
  resources :articles do
    resources :votes, only: [:create, :destroy]
      
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
