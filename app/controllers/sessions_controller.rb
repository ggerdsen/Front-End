class SessionsController < ApplicationController
  def create
    body = {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      access_token: request.env['omniauth.auth']
    }
    uid = request.env['omniauth.auth'][:uid]
    session[:uid] = uid

    response = Faraday.post("http://localhost:3000/api/v1/#{session[:user_type]}") do |request|
      request.body = body
    end

    if session[:user_type] == 'students'
      redirect_to '/student/dashboard'
    else
      redirect_to '/teacher/registration'
    end
  end
end
