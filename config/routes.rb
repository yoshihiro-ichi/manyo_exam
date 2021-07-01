Rails.application.routes.draw do
resources :tasks
root 'task#index'
end
