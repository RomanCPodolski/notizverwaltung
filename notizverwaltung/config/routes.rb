Notizverwaltung::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_private_session
  end
  get "notes/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :notes do
    resources :comments
  end

  resources :user#, :comments

  #get 'user/:id' => 'user#show'
  #get 'user/:id/update' => 'user#update'
  #get 'user/:id/destroy' => 'user#destroy'

  get 'notes/:id' => 'notes#show'
  get 'notes/:id/edit' => 'notes#edit'
  post 'notes/search' => 'notes#search'
  post 'notes/export_json' => 'notes#export_json'
  post 'notes/import_json' => 'notes#import_json'
  post 'notes/upload' => 'notes#upload'
    # You can have the root of your site routed with "root"
  root 'notes#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view

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
