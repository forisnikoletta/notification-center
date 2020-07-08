Rails.application.routes.draw do
  
  devise_for :users
  #devise_for :users, path: '', path_names: { sign_in: 'login', sign_out:'logout', sign_up: 'register' }


  jsonapi_resources :notifications
  #jsonapi_resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "notifications#index"
end
