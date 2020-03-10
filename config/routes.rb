Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "shops#index"
  resources :shops, only: [:index, :show, :new, :create]
  resources :users, only: [:show, :edit, :update]

end
