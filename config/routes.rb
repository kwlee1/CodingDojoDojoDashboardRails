Rails.application.routes.draw do
  get 'students/index'

  get 'students/show'

  get 'students/edit'

  get 'students/update'

  get 'students/destroy'

  get '' => 'dojos_controller#index'
  get 'dojos' => 'dojos_controller#index'
  get 'dojos/new' => 'dojos_controller#new'
  post 'dojos/create' => 'dojos_controller#create'
  get 'dojos/:id/edit' => 'dojos_controller#edit'
  post 'dojos/:id/update' => 'dojos_controller#update'
  get 'dojos/:id/destroy' => 'dojos_controller#destroy'
  get 'dojos/:id/students/new' => 'students#new'
  post 'dojos/:id/students/create' => 'students#create'
  get 'dojos/:id/students/:student_id'=> 'students#show'
  get 'dojos/:id/students/:student_id/edit' => 'students#edit'
  post 'dojos/:id/students/:student_id/update' => 'students#update'
  get '/dojos/:id/students/:student_id/destroy' => 'students#destroy'
  get 'dojos/:id' => 'dojos_controller#show'
  get 'dojos_controller/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
