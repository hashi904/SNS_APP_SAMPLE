Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  post "likes/:tweet_id/create" , to: 'likes#create', as: 'likes_create'
  delete 'likes/:tweet_id/destroy' , to: 'likes#destroy', as: 'likes_destroy'
  root  'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
end
