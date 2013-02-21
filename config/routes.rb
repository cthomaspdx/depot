Depot::Application.routes.draw do

  

  get 'admin' => "admin#index"
  
  controller :session do
  get 'login'=> :new

  post 'login' => :create

  delete  'logout' => :destroy
    end 

  resources :users


  resources :orders


  resources :line_items


  resources :carts

  


  get "store/index"

  resources :products do 
    resources :reviews
    get :who_bought, on: :member
    end

resources :line_items do
    #member do
    #  put 'decrement'
    #end
    put 'decrement', on: :member
  end
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
  #match 'public/index' => 'resume#view'
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
#root :to => 'high_voltage/pages#index', :id => 'index'
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'store#index', as: 'store'

  # See how all your routes lay out with "rake routes"
  #match ':action' => 'static#:action'
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
