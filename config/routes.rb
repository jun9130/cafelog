Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "shops#index"
  resources :shops do
    resources :reviews, only: [:new, :create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

end
