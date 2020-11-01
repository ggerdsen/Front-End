Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  namespace :teachers do
    # resources :courses, only: [:show]
    resources :courses, only: [:show, :index] do
      resources :students, only: [:show, :index]
    end
    # get '/courses/:course_id', to: 'courses#show'
    # get '/courses/:course_id/edit', to: 'courses#edit'
    # patch '/courses/:course_id', to: 'courses#update'
  end

  namespace :student do
    resources :courses, only: [:show, :index]
  end
end
