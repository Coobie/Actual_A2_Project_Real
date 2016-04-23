
Rails.application.routes.draw do
devise_for :users, :controllers => { registrations: 'registrations' }
  get 'welcome/index'
  get 'calendar_page/index'
  get 'users/index' => 'users#index', as: :index_user
  get 'users/new', to: 'users#new'
  get 'users/:id/edit', to: 'users#edit', as: :editing_user
  get 'users/show/:id', to: 'users#show'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user

  get 'devices/new', to: 'devices#new'
  get 'devices/index' => 'devices#index', as: :index
  get 'devices/:id/edit', to: 'devices#edit', as: :editing_device
  get 'devices/show/:id', to: 'devices#show'
  get'devices/edit/:id' => 'products#destroy', :via => :delete
  resources :searches
  resources :devices
  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
