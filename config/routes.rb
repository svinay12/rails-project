Rails.application.routes.draw do
  
  get 'user/show'
  get 'user/index'
  root 'page#index'
  
  get 'property/index'
  get 'property/show'
  get 'property/new'
  get 'property/create'
  get 'property/edit'
  get 'property/update'
  get 'property/delete'
  
  devise_for :users, controllers: {
        sessions: 'devise_users/sessions',
        confirmations: 'devise_users/confirmations',
        passwords: 'devise_users/passwords',
        registrations: 'devise_users/registrations',
        unlocks: 'devise_users/unlocks'
      }

  # devise_scope :users do
  #   get    'user/show'   => 'user/show',
  #   get    'user/index'   => 'user/index'
  # end

  resource :property
end