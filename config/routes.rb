Lopet::Application.routes.draw do


  root :to => 'welcome#index'
	match 'home' => 'welcome#home', :as => 'home'

	# User management
	resources :users
	resources :sessions
	get 'sign_up' => 'users#new', :as => 'sign_up'
	get 'log_out' => 'sessions#destroy', :as => 'log_out'
	get 'log_in' => 'sessions#new', :as => 'log_in'

	# Admin
	resources :admin_sessions
	get 'admin_log_out' => 'admin_sessions#destroy', :as => 'admin_log_out'
	get 'admin_log_in' => 'admin_sessions#new', :as => 'admin_log_in'
		
	# Data
  resources :tipos do
		resources :derechos
	end
  resources :formularios do
		get 'preview', :on => :member
	end
	resources :derechos do
		resources :formularios
	end

#	resources :derechos
# match 'derechos/edit/:id' => 'derechos#edit', :as => 'edit_derecho'
#	match 'derechos/show/:id' => 'derechos#show', :as => 'derecho'
#	match 'derechos/new/:id' => 'derechos#new', :as => 'new_derecho'
#	put 'derechos/update/:id' => 'derechos#update', :as => 'update_derecho'
#	match 'derechos/create/:id' => 'derechos#create', :as => 'create_derecho'
	
	# Accion	
	get 'accions' => 'accions#index', :as => 'accions'
	match 'accions/show/:id' => 'accions#show', :as => 'accion'
	match 'accions/edit/:id' => 'accions#edit', :as => 'edit_accion'
	match 'accions/create/:id' => 'accions#create', :as => 'create_accion'
	match 'accions/update/:id' => 'accions#update', :as => 'update_accion'

	# Logic
	get 'generate' => 'generator#generate', :as => 'generate'
	get 'generatex' => 'generator#generate_example', :as => 'generatex'
	

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

  # You can have the root of your site routed with 'root'
  # just remember to delete public/index.html.

  # See how all your routes lay out with 'rake routes'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
