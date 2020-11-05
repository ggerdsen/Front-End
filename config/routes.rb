Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post '/registration', to: 'welcome#create_user'

  namespace :teachers do
    get '/registration', to: 'teachers#new'
    post '/courses/:id/wars', to: 'courses#create_war'
    delete '/courses/wars/:id', to: 'courses#destroy_war'
    resources :courses do
      resources :students, only: [:show, :index]
    end
  end

  namespace :students do
    resources :courses, only: [:show, :index, :create, :destroy]
  end
end
