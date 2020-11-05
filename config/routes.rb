Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post '/registration', to: 'welcome#create_user'

  namespace :teachers do
    # resources :courses, only: [:show]
    # get '/courses/find', to: 'search#show'
    resources :courses, only: [:show, :index] do
      resources :students, only: [:show, :index]
    end
    # get '/courses/:course_id', to: 'courses#show'
    # get '/courses/:course_id/edit', to: 'courses#edit'
    # patch '/courses/:course_id', to: 'courses#update'
  end

  namespace :students do
    resources :courses, only: [:show, :index, :create]
  end
end
