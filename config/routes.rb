Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :sessions
  resources :welcome, only: [:home]

  get '/new', to: 'users#new' 
end
