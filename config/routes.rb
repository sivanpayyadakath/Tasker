Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :todos do
      member do
        patch :task_completed
        patch :task_started
      end
    end
    root 'todos#index'
  end
end
