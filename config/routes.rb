Rails.application.routes.draw do
  namespace :admin do
    resources :masters do
      resources :tattoos
    end
    
    resources :tattoos
    resources :subscriptions
  end
  
  devise_for :users

  resources :masters do
    resources :tattoos
  end

  resources :tattoos
  resources :subscriptions, only: [:create, :show]
  
  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
