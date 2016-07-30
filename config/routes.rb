Rails.application.routes.draw do
  root 'static_pages#home'

  # Static pages routes, not connected to models
  get '/help',  to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/support',  to: 'static_pages#support'

  # Dynamic routes
  get '/signup', to: 'users#new'

  # RESTful routes (CRUD)
  resources :users
end
