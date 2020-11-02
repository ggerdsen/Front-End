Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  post '/registration', to: 'welcome#create_user'

  get '/student/dashboard', to: 'students#dashboard'

  get '/teacher/dashboard', to: 'teachers#dashboard'
end
