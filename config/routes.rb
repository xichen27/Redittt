Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new]
  
  resource :session, only: [:create, :new, :destroy]
  
  resources :subs, except: :destroy do
    resources :posts, only: [:new]
  end
  
  resources :posts, only: [:show, :create, :update, :edit]

  
end
