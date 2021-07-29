# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
      resources :users
      resources :sessions, only: [:create]
      get '/categories', to: 'categories#index'
    end
  end
end
