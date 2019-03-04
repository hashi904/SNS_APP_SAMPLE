Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  post "likes/:tweet_id/create" , to: 'likes#create'
  delete 'likes/:tweet_id/destroy' , to: 'likes#destroy'
  root  'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
end
