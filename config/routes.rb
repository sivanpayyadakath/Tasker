Rails.application.routes.draw do


  get 'errors/not_found'

  get 'errors/internal_server_error'

  root 'todos#index'

  get 'sessions/new'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/admin', to: 'users#index'

  get '/404', to: 'errors#not_found', :via => :all

  get '/500', to: 'errors#internal_server_error', :via => :all


  resources :users do
    patch :make_admin
    patch :remove_admin
    resources :todos do
      member do
        patch :task_completed
        patch :task_started
      end
    end
  end

end
