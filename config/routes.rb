Rails.application.routes.draw do
  resources :likes
  resources :tweets
  post 'home/index'
  get 'home/index'
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  get 'my_tweets/:id', to: 'users#show', as: 'my_tweets'
  post 'retweet/:id', to: 'tweets#retweet', as: 'retweet'
  post 'like/:id', to: 'likes#create', as: 'liked'
  delete 'unlike/:id', to: 'likes#destroy', as: 'unliked'
  post 'add/:id', to: 'follows#create', as: 'added'
  delete 'out/:id', to: 'follows#destroy', as: 'unfollow'
  get 'find_people', to: 'users#find_people', as: 'find_people'
  post 'finded/:id', to: 'follows#finded', as: 'finded'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
