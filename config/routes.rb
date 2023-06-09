Rails.application.routes.draw do
  get 'home/index'
  get 'home/new'
  root 'page#index'

  get 'project/requirement_index' => 'project#requirement_index'
  get 'project/requirement_show/:id' => 'project#requirement_show'
  
  resources :user, only: [:show, :index ]

  get 'address/edit' => 'user#edit_address'
  get 'address/create' => 'user#new_address'
  patch 'address' => 'user#update_address' 
  put 'address' => 'user#update_address'
  delete 'address' => 'user#destroy_address'
  post 'address' => 'user#create_address'
  
  devise_for :users, controllers: {
        sessions: 'devise_users/sessions',
        confirmations: 'devise_users/confirmations',
        passwords: 'devise_users/passwords',
        registrations: 'devise_users/registrations',
        unlocks: 'devise_users/unlocks'
      }
      
  resources :property
  resources :project

end