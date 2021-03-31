Rails.application.routes.draw do
  get '/signin', to: 'sessions#signin'
  get '/', to: 'users#new', as: 'root'
  post '/signin', to: 'users#show'
  resources :users
  resources :rides
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
