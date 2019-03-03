Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :users, only: [:index, :show]
  root  'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
end
