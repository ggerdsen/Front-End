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
    response = Faraday.post('http://localhost:3000/api/v1/students') do |request|
      request.body = body
    end
    binding.pry

    # conn = Faraday.new(url: 'http://localhost:3000/api/v1', headers: {'Accept': 'application/json'})
    # response = conn.post('/students') do |req|
    #   req.params['client_id'] = client_id
    #   req.params['client_secret'] = client_secret
    #   req.params['omniauth'] = request.env['omniauth.auth']
    # end
    # "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params["id_token"]}"
  end
end
