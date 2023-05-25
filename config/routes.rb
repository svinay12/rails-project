Rails.application.routes.draw do

  get 'project/index'
  get 'project/show'
  get 'project/new'
  get 'project/create'
  get 'project/edit'
  get 'project/update'
  get 'project/delete'
  get 'user/show'
  get 'user/index'
  root 'page#index'

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