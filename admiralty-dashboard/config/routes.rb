Rails.application.routes.draw do
  
  resources :actions
  resources :ships
  resources :captains do 
    resources :actions, only: [:index, :show]
    resources :ships, only: [:new]
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
