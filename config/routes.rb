Game::Application.routes.draw do
  
  devise_for :users, :controllers => {:sessions => "sessions"}

  resources :users

  root :to => "home#index"
end
