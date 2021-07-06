Rails.application.routes.draw do
resources :tasks
root 'tasks#index'
get 'search' => 'tasks#search'
end
