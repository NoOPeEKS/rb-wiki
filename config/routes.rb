Rails.application.routes.draw do
  resources :tools
  resources :proposals
  resources :projects
  resource :user, only: [:show]
  devise_for :users

  # User authenticated routes
  authenticate :user do
    resources :articles, except: [:index, :show]
  end

  get "search", to: "search#search", as: :search

  resources :articles, only: [:index, :show]

  resources :categories, only: [:new, :index, :create]

  get "chat", to: "chat#index"
  post "chat/send_message", to: "chat#send_message"

  
  root "home#index"
end
