Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  patch "/status_update/:id" => 'plants#status_update', as: 'status_update'

  get "/fetch_plants" => 'plants#from_type', as: 'fetch_plants'

  resources :plants do
    resources :chatrooms, only: :create
  end

  resources 'profile', to: 'users_info#index', as: :profile

  resources :chatrooms, only: :show do
    resources :transitions, only: [:create, :index]
    resources :messages, only: :create
  end

 
  resources :favourites, only: [:create, :destroy]
 
end
