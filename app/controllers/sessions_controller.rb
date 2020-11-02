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
    else session[:user_type] == 'teachers'
      redirect_to '/teacher/dashboard'
    end
  end

  def destroy
    session[:user_type] == ''
    session.destroy
    redirect_to root_path
  end
end
