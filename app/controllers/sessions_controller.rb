class SessionsController < ApplicationController
  def create
    # * looks like access token is taken care of by omniauth gem
    # * you can confirm this in pry session by calling request.env['omniauth.auth']
    # and this will show the hash with the info we need for OAuth2
    # * trying to post to backend api database so that the Student user is actually saved
    # * we think the Student model method in the backend repo (update_or_create) will be called in Api Students controller
    body = {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      access_token: request.env['omniauth.auth']
    }
    id = request.env['omniauth.auth'][:uid]
    session[:uid] = id

    # response = Faraday.get("http://localhost:3000/api/v1/#{session[:user_type]}/#{id}") do |request|
    #   request.params[:id] = id
    # end

    response2 = Faraday.post("http://localhost:3000/api/v1/#{session[:user_type]}") do |request|
      request.body = body
    end


    if session[:user_type] == 'students'
      redirect_to '/student/dashboard'
    else
      redirect_to '/teacher/registration'
    end
  end
end
