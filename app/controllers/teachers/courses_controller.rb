class Teachers::CoursesController < ApplicationController
  def index
    @teacher = current_user
    @courses = TeachersFacade.get_all_courses(@teacher.id)
  end

  def create
    @teacher = current_user
    TeachersFacade.post_new_course(course_params, params[:id], @teacher.id)
    redirect_to teachers_courses_path
  end

  def show
    response = Faraday.get("https://git.heroku.com/polar-anchorage-12813.git/api/v1/teachers/courses/#{params[:id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @course = Course.new(course_data)
  end

  def edit
    @course = TeachersFacade.edit_course(params[:id])
  end

  def update
    update_params = {course_id: params[:id]}
    if !course_params[:name].nil?
      update_params[:name] = course_params[:name]
    end
    if !course_params[:school_name].nil?
      update_params[:school_name] = course_params[:school_name]
    end
    @course = TeachersFacade.update_course(params[:id], update_params)
    redirect_to teachers_courses_path
  end

  def destroy
    TeachersFacade.destroy_course(params[:id])
    redirect_to teachers_courses_path
  end

  private

  def course_params
    params.permit(:name, :school_name, :teacher_id)
  end
end
