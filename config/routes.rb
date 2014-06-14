TravelApp::Application.routes.draw do



  resource :profile, only: [:edit, :update]
  resources :favorites
  resources :follows
  resources :comments, :only => [:create, :destroy]


  get "profiles/index"

  get "sessions/new"

  get "blogs/user_blog", to: "blogs#user_blog"
  resources :blogs do
    resources :posts
      resources :comments, only: [:create]
  end



  resources :videos, only: [:index, :new, :create]

  devise_for :users

  root to: "home#index"
end
