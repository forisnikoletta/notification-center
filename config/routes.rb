Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  resources :notifications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
