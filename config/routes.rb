Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get "hello/:name" => "example#hello"

  # Registration Routes
  get "signup", to: "registration#new"
  post "signup", to: "registration#create"

  # Session Routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"

  get "posts", to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id/edit", to: "posts#edit", as: "post_edit" 
  post "posts", to: "posts#create"
  get "posts/:id", to: "posts#show", as: "post"
  put "posts/:id", to: "posts#update" # have to specify the verb when using this route because you have two of the same routes (see edit.erb) 
  delete "posts/:id", to: "posts#destroy"
  post "posts/:id/comments", to: "comments#create", as: "comments"

  get "tag/:name", to: "tags#tagged"



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
