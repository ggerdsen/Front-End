Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  post '/registration', to: 'welcome#create_user'

  get '/teacher/registration', to: 'teachers#new'

  namespace :student do
    resources :courses, only: [:show, :index]
  end

  namespace :teacher do
    resources :courses, only: [:show, :index] do
      resources :students, only: [:show, :index]

    end
  end

end
