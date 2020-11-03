Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post '/registration', to: 'welcome#create_user'

  namespace :student do
    resources :courses, only: [:show, :index]
   end

   resources :teacher, only: [:update]

  namespace :teacher do
    resources :courses, only: [:show, :index]
  end
end
