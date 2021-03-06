Rails.application.routes.draw do

  get 'static_pages/about'
  get 'static_pages/contact'
  root to: 'static_pages#index'

   # Devise for user
   devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
   ActiveAdmin.routes(self)

  devise_for :users

  resources :carts
  resources :orders
  resources :items do
    resources :images, only: [:create]
  end

  # Account settings
  get 'account/profile', to: "users#profile"
  patch 'account/profile', to: "users#update_profile"
  get 'account/secret', to: "users#secret"

  # Static page
  get '/about', to: 'static_pages#about', as: 'about'
  get '/contact', to: 'static_pages#contact', as: 'contact'


  resources :charges
end
