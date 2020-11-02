class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart,
                :current_user,
                :current_teacher?,
                :current_student?
  def current_user
    if session[:user_type] == 'teachers'
      @current_user ||= Teacher.find(session[:uid]) if session[:uid]
    else
      @current_user ||= Student.find(session[:uid]) if session[:uid]
    end
  end

  def current_student?
    current_user && current_user.student_id
  end

  def current_teacher?
    current_user && current_user.teacher_id
  end

  def require_user
    render file: 'public/404', status: 404 unless current_user
  end

  def require_teacher
    render file: 'public/404', status: 404 unless current_teacher?
  end

  def generate_flash(resource)
    resource.errors.messages.each do |validation, message|
      flash[validation] = "#{validation}: #{message}"
    end
  end

end
