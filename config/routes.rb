Rails.application.routes.draw do
  resource :user, only: [:show]
  devise_for :users

  # User authenticated routes
  authenticate :user do
    resources :articles, except: [:index, :show]
  end

  resources :articles, only: [:index, :show]

  resources :categories, only: [:new, :index, :create]

  
  root "home#index"
end
