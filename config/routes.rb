Store::Application.routes.draw do

  resources :orders

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products

  resources :brands

  resources :categories

  resources :line_items

  root :to => "home#index"
end
