Rails.application.routes.draw do
  resources :tweets
  get 'home/index'
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  post 'retweet/:id', to: 'tweets#retweet', as: 'retweet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
