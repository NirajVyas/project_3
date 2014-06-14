TravelApp::Application.routes.draw do

  resource :profile, only: [:edit, :update]
  resources :favorites
  resources :follows

  get "profiles/index"

  get "sessions/new"

  get "blogs/user_blog", to: "blogs#user_blog"
  resources :blogs do
    resources :posts
  end



  resources :videos, only: [:index, :new, :create]

  devise_for :users

  root to: "home#index"
end
