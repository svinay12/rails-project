Rails.application.routes.draw do
  

  
  root 'page#index'
  
  devise_for :users , :controllers => { registrations: 'user' }
  
  devise_scope :user do
    get 'user/show', to: "user#show"
    get 'user/update',  to: "user#update"
  end
end
