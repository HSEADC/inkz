Rails.application.routes.draw do
  require 'resque/server'
  mount Resque::Server, at: '/jobs'

  post 'support/request_support'

  resources :feedbacks
  namespace :api do
    namespace :v1 do
      resources :masters
      resources :tattoos do
        collection do
          get 'by_part/:part', to: 'tattoos#by_part', as: 'parted'
          get 'by_style/:style', to: 'tattoos#by_style', as: 'styled'
          get 'tags', to: 'tattoos#tags'
        end
      end

      resources :masters do
        resources :tattoos
      end

      # resources :subscriptions

      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "sessions#destroy"
      end
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
        get 'by_part/:part', to: 'tattoos#by_part', as: "parted"
        get 'by_style/:style', to: 'tattoos#by_style', as: "styled"
      end
    end

    resources :tags, only: [:index]
    resources :subscriptions
    resources :feedbacks
  end

  resources :users do
    get 'favorite_tattoos', to: 'users#favorite_tattoos', on: :member
  end

  resources :masters do
    resources :tattoos
    resources :feedbacks
  end

  resources :tattoos do
    collection do
      get 'by_part/:part', to: 'tattoos#by_part', as: "parted"
      get 'by_style/:style', to: 'tattoos#by_style', as: "styled"
    end

    # member do
    #   get 'toggle_favourite', to: 'tattoos#toggle_favourite', as: 'toggle_favourite'
    # end

    post 'toggle_favorite', on: :member
  end

  resources :tattoos
  resources :feedbacks, except: [:index, :show]
  resources :subscriptions, only: [ :show, :create]

  devise_for :users

  get '/promo', to: 'welcome#index'
  get '/team', to: 'welcome#team'
  get 'welcome/search'
  # get 'welcome/assistance'

  root "tattoos#index"
end
