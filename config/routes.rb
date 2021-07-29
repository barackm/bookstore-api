Rails.application.routes.draw do
  root 'books#index'
  resources :users
  get '/categories', to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
