Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'users/hello', to: 'users#hello'

  post '/login', to: 'sessions#create'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
