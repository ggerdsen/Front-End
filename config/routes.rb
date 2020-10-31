Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  post '/registration', to: 'welcome#create_user'

  get '/student/registration', to: 'students#new'
end
