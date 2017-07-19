Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create]
  #or
  #get '/users/:id', to 'users#show'

  root "welcome#index"
end
