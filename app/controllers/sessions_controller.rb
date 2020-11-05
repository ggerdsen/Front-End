class SessionsController < ApplicationController
  def create
    body = {
              client_id: ENV['GOOGLE_CLIENT_ID'],
              client_secret: ENV['GOOGLE_CLIENT_SECRET'],
              user_data: request.env['omniauth.auth']
            }

    uid = request.env['omniauth.auth'][:uid]
    session[:uid] = uid
    response = Faraday.post("https://git.heroku.com/polar-anchorage-12813.git/api/v1/#{session[:user_type]}") do |request|
      request.body = JSON.generate(body)
    end

    if session[:user_type] == 'students'
      redirect_to '/students/courses'
    else session[:user_type] == 'teachers'
      redirect_to '/teachers/courses'
    end

  end

  def destroy
    session[:user_type] == ''
    session.destroy
    redirect_to root_path
  end
end
