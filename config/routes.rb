Rails.application.routes.draw do
  resources :cliente_proveedors
  resources :evaluaciones_anuales
  resources :upward_fbks
  resources :users
  post '/auth/login', to: 'authentication#login'
  post '/users/batch_upload', to: 'users#batch_upload'
  post '/evaluaciones_anuales/batch_upload', to: 'evaluaciones_anuales#batch_upload'
  post '/upward_fbks/batch_upload', to: 'upward_fbks#batch_upload'
  post '/cliente_proveedors/batch_upload', to: 'cliente_proveedors#batch_upload'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
