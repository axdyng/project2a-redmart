Rails.application.routes.draw do
  root 'static_pages#home'

  # Static pages routes, not connected to models
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/support', to: 'static_pages#support'

  # Dynamic routes (users)
  get '/signup',  to: 'users#new'
  #get '/account/:id/edit', to: 'users#edit', as: :account
  #post '/signup',  to: 'users#create'

  # Login routes (session)
  get     '/login',   to: 'sessions#new'
  get     '/account',  to: 'sessions#edit'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  # RESTful routes (CRUD)
  resources :users,   except:[ :new ]
end
