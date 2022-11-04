Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
