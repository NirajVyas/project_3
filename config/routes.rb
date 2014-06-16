TravelApp::Application.routes.draw do



  resource :profile, only: [:edit, :update]
  resources :favorites
  resources :follows
  resources :cities

  resources :comments, :only => [:create, :destroy]

  get 'tags/:tag', to: 'blogs#index', as: :tag

  get "profiles/index"

  get "/blogs/user_search", to: "blogs#user_search"

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
