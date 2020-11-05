class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_type] == 'students'
      @current_user ||= StudentFacade.find(session[:uid]) if session[:uid]
    else
      @current_user ||= TeacherFacade.find(session[:uid]) if session[:uid]
    end
  end
end
