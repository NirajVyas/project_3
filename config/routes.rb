TravelApp::Application.routes.draw do
  resources :blogs


  resources :posts


  devise_for :users

  root to: "home#index"
end
