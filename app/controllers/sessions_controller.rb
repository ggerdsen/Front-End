class SessionsController < ApplicationController
  def create
    body = {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      access_token: request.env['omniauth.auth']
    }
    id = request.env['omniauth.auth'][:uid]
    session[:uid] = id

    response = Faraday.post("http://localhost:3000/api/v1/#{session[:user_type]}") do |request|
      request.body = body
    end

    if session[:user_type] == 'students'
      redirect_to '/students/courses'
    else
      redirect_to '/teachers/registration'
    end
  end
end
