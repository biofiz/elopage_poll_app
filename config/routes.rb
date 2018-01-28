Rails.application.routes.draw do
  root 'polls#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :polls
  get 'answers/:uuid/new', controller: 'answers', action: 'new', as: 'vote'
  resources :answers, only: :create
end
