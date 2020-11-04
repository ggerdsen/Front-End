class WelcomeController < ApplicationController
  def index; end

  def create_user
    if params[:user_type]
      session[:user_type] = params[:user_type]
      redirect_to '/auth/google_oauth2'
    else
      redirect_to root_path
      # flash[:notice] = 'You must select teacher or student'
      # need to add flash to application.something???
    end
  end
end
