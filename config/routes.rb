Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 請依照專案指定規格來設定路由
  devise_for :users

  resources :users, only: [:edit, :update] do
    
    member do
      get :tweets
    end

    member  do
      get :likes
    end

    member do
      get :followings
    end

    member do
      get :followers
    end

  end

  resources :followships, only: [:create, :destroy]

  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index, :create]

    member do
      post :like
      post :unlike
    end

  end
  root 'tweets#index'

  namespace :admin do
    resources :users, only: [:index]
    resources :tweets, only: [:index, :destroy]
    root 'tweets#index'
  end


end
