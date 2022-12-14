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

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :create], format: :json do
          resources :comments, only: [:create], format: :json
          resources :likes, only: [:create], format: :json
        end
      end
    end
  end
end
