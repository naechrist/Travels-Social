Rails.application.routes.draw do
  resources :locations
  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/users/reviews', to: 'users#reviews'
  resources :reviews
  resources :states do 
    resources :reviews, only: [:new, :index]
  end 
  resources :countries
  resources :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
