Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  namespace :teachers do
    # resources :courses, only: [:show]
    get '/courses/:course_id', to: 'courses#show'
    get '/courses/:course_id/edit', to: 'courses#edit'
    patch '/courses/:course_id', to: 'courses#update'
  end
end
