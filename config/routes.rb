Rails.application.routes.draw do
  resources :feedbacks
  namespace :api do
    namespace :v1 do

      resources :masters
      resources :tattoos

      resources :masters do
        resources :tattoos
      end

      # resources :subscriptions
    end
  end

  namespace :admin do
    resources :masters do
      resources :tattoos
      resources :feedbacks, only: [ :index, :delete]
    end

    resources :masters
    resources :tattoos do
      collection do
        get 'by_tag/:tag', to: 'tattoos#by_tag', as: "tagged"
      end
    end
    resources :subscriptions
    resources :feedbacks
  end

  resources :masters do
    resources :tattoos
    resources :feedbacks
  end

  resources :tattoos do
    collection do
      get 'by_tag/:tag', to: 'tattoos#by_tag', as: "tagged"
    end
  end

  resources :tattoos
  resources :feedbacks, except: [:index, :show]
  resources :subscriptions, only: [ :show, :create]

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'

  get 'about', to: 'welcome#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
