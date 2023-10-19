Rails.application.routes.draw do
  namespace :admin do
    resources :subscriptions
  end
  
  devise_for :users

  resources :subscriptions, only: [:create, :show]
  resources :tattoos
  
  resources :masters do
    resources :tattoos
  end

  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
