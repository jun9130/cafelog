Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'shops#index'
  resources :shops do
    resources :reviews, only: [:new, :create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
  
  resources :searches, only: [:index]

  resources :tags do
    get 'shops', to: 'shops#search'
  end
  
  get 'pages/privacy' => 'pages#privacy'
  get 'pages/rule' => 'pages#rule'
end
