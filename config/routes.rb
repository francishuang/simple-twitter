Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users, only: [:show, :edit, :update] do
    member do
      get :tweets
    end

  end

  # 請依照專案指定規格來設定路由
  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index, :create]
  end
  
  root 'tweets#index'

  namespace :admin do
    resources :users, only: [:index]
    resources :tweets, only: [:index, :destroy]
    root 'tweets#index'
  end


end
