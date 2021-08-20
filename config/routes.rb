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
  post 'retweet/:id', to: 'tweets#retweet', as: 'retweet'
  post 'like/:id', to: 'likes#create', as: 'liked'
  delete 'unlike/:id', to: 'likes#destroy', as: 'unliked'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
