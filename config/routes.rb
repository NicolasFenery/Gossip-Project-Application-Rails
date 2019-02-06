Rails.application.routes.draw do

  resources :gossips

  root 'home#index'
  get 'welcome/:first_name', to: 'welcome#landing'
  get 'users/:id', to: 'users#profile', as: 'user'
  get 'pages/team', to: 'pages#team'
  get 'pages/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
