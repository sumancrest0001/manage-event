Rails.application.routes.draw do
  get 'users/show'
  root 'pages#home'
  get '/about', to: 'pages#about'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :users
  resources :events
  resources :attendences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
