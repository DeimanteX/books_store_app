Rails.application.routes.draw do
  devise_for :users

  resources :authors do
    resources :books, only: [:index]
  end
  resources :books, only: [:index, :show, :new, :update, :create, :edit] do
    resources :coupons, only: [:create]
  end

  root 'books#index'
end