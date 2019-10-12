Rails.application.routes.draw do
  resources :ratings
  resources :comments
  resources :lessons
  resources :users
  
  root 'sessions#new'
  get "/bestuser", to: "users#best_users", as: "best_users"

  resources :users do
    resources :lessons, only: [:new, :create, :index, :show]
  end

  resources :lessons do
    resources :ratings, only: [:new, :create, :index, :show]
  end

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/' => 'sessions#new'
  post '/' => 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'
end
