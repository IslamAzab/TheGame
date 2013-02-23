Game::Application.routes.draw do

  get 'game/(:id)/result/:result_id' => 'game#result_history', :as => :result_history

  get "game/(:id)" => 'game#index', :as => :show_game
  
  put "game/:id" => 'game#update', :as => :update_game

  get "team" => "team#index", :as => :team

  get "team/:id/scoring_cards" => "team#scoring_cards", :as => :player_scoring_cards

  put "team/:id/scoring_cards" => "team#update_player_scoring_cards", :as => :update_player_scoring_cards
    
  get "profile" => "profile#profile"
  
  # get "profile/edit" => "profile#edit"
  get "profile/edit"

  put "profile" => "profile#update", :as => :update_profile

  # get "profile/show"
  # get "profile/:id" => "profile#show", :as => :show_other_profile
  
  devise_for :users, :controllers => {:sessions => "sessions"}, :path => 'accounts'

  resources :users

  root :to => "game#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  # root :to => 'store#index', :as => 'store'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
