Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :masters
      resources :tattoos

      # resources :masters do
      #   resources :tattoos
      # end

      # resources :subscriptions
    end
  end

  namespace :admin do
    resources :masters do
      resources :tattoos
    end

    resources :masters
    resources :tattoos
    resources :subscriptions
  end

  resources :masters do
    resources :tattoos
  end

  resources :tattoos
  resources :subscriptions, only: [:create, :show]

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'

  get 'about', to: 'welcome#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
