Rails.application.routes.draw do


  get 'sessions/new'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  root 'sessions#new'

  resources :users do
    resources :todos do
      member do
        patch :task_completed
        patch :task_started
      end
    end
  end

end
