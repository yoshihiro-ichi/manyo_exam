Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:index, :show]
  namespace :admin do
    resources :users
  end 
end
