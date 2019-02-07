Rails.application.routes.draw do

  get 'city/show'
  resources :gossips
  resources :users
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  root 'home#index'
  get 'welcome/:first_name', to: 'welcome#landing'
  get 'pages/team', to: 'pages#team'
  get 'pages/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
