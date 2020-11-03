class Teachers::CoursesController < ApplicationController
  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  def index
    teacher_id = 14
    response = conn("/api/v1/teachers/#{teacher_id}").get
    teacher = JSON.parse(response.body, symbolize_names: true)

    teacher_course_params = {teacher_id: teacher[:data][:id].to_i}
    response = conn("/api/v1/teachers/courses").get do |request|
      request.body = teacher_course_params
    end
    json = JSON.parse(response.body, symbolize_names: true)
    @courses = json[:data].map do |course_data|
      Course.new(course_data)
    end
  end

  def create
    teacher_id = 14
    response = conn("/api/v1/teachers/#{teacher_id}").get
    teacher = JSON.parse(response.body, symbolize_names: true)

    teacher_course_creation_params = {
      name: course_params[:name],
      teacher_id: teacher[:data][:id].to_i,
      school_name: course_params[:school_name]
    }

    response = conn("/api/v1/teachers/courses/#{params[:id]}").post do |request|
      request.body = teacher_course_creation_params
    end

    JSON.parse(response.body, symbolize_names: true)
    redirect_to teachers_courses_path
  end

  def show
    teacher_id = 14
    response = Faraday.get("http://localhost:3000/api/v1/teachers/courses/#{params[:id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @course = Course.new(course_data)
  end

  def edit
    response = Faraday.get("http://localhost:3000/api/v1/teachers/courses/#{params[:id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @course = Course.new(course_data)
  end

  def update
    update_params = {course_id: params[:id]}
    if !course_params[:name].nil?
      update_params[:name] = course_params[:name]
    end
    if !course_params[:school_name].nil?
      update_params[:school_name] = course_params[:school_name]
    end
    response = conn("/api/v1/teachers/courses/#{params[:id]}").patch do |request|
      request.body = update_params
    end
    course_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @course = Course.new(course_data)
    redirect_to teachers_courses_path
  end

  def destroy
    course_id = params[:id]
    conn("/api/v1/teachers/courses/#{course_id}").delete
    redirect_to teachers_courses_path
  end

  private

  def course_params
    params.permit(:name, :school_name, :teacher_id)
  end
end
