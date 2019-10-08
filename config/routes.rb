Rails.application.routes.draw do
  resources :ratings
  resources :comments
  resources :lessons
  resources :users
  
  root 'sessions#new'

  resources :users do
    resources :lessons, only: [:new, :create, :index]
  end

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/' => 'sessions#new'
  post '/' => 'sessions#create'

  delete '/signout', to: 'sessions#destroy'
  
end
