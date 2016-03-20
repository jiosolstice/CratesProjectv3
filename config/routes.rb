Rails.application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  get 'password_resets/new'
  get 'password_resets/edit'

    root 'pages#home'
    
    get 'fam' => 'admins#show', as: 'admin'
    
    get 'signup' => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    
    get 'search' => 'crates#index'
    
    get 'community' => 'pages#community', as: 'community'
    get 'tags/:tag', to: 'crates#index', as: 'tag'
    get 'help_desk' => 'pages#help', as: 'help'
    
    resources :users do
        resources :profiles
    end
    
    resources :groups, only: [:show,:index]
    resources :crates
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
     resources :reports, only: [:create,:destroy,:show,:index]
 
  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
    
end
