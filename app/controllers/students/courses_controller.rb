class Students::CoursesController < ApplicationController
  def index
    @current_user = current_user
  end
end
