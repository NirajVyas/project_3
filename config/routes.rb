TravelApp::Application.routes.draw do

  resources :farmers


  get "welcome/index"

  resources :donations


  resources :blogs do
    resources :posts
  end

  resources :videos, only: [:index, :new, :create]


  devise_for :users

  root to: "home#index"
end
