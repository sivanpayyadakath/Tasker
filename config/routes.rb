Rails.application.routes.draw do


  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  resources :users do
    resources :todos do
      member do
        patch :task_completed
        patch :task_started
      end
    end

  end
end
