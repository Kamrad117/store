Store::Application.routes.draw do

  get 'pages/show'

  root :to => "home#index"

  resources :orders

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products

  resources :brands

  resources :categories

  resources :line_items

  mount Ckeditor::Engine => '/ckeditor'

end
