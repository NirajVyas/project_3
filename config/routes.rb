TravelApp::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  match "/feed" => "blogs#feed", :as => :feed, :defaults => { :format => "atom" }


  resource :profile, only: [:edit, :update]
  resources :favorites
  resources :follows
  resources :cities
  resources :forum


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
