Rails.application.routes.draw do
  resources :cliente_proveedors
  resources :evaluaciones_anuales
  resources :upward_fbks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
