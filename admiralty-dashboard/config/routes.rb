Rails.application.routes.draw do
  
  resources :actions
  resources :ships
  resources :captains do 
    resources :actions, only: [:index, :show]
    resources :ships, only: [:index, :show, :new]
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/403', to: 'application#forbidden'
  get '/auth/github/callback' => 'sessions#create'
end
