Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get "/fetch_plants" => 'plants#from_type', as: 'fetch_plants'

  resources :plants do
    resources :chatrooms, only: :create 
  end
  
  resources :chatrooms, only: :show do
    resources :transitions, only: :create
    resources :messages, only: :create
  end
end
