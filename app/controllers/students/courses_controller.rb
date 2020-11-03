class Students::CoursesController < ApplicationController
  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  def index
    student_id = 1 # @student = current_user[:uid]
    response = conn("/api/v1/students/#{student_id}").get
    student = JSON.parse(response.body, symbolize_names: true)
    student_course_params = {student_id: student[:data][:id].to_i}
    response = conn("/api/v1/students/courses").get do |request|
      request.body = student_course_params
    end
    json = JSON.parse(response.body, symbolize_names: true)

    @courses = json[:data].map do |course_data|
      Course.new(course_data)
    end
  end

  def create
    response = conn("/api/v1/teachers/courses/find?courseCode=#{student_course_params[:enrollment]}").get
    exists = JSON.parse(response.body, symbolize_names: true)

    if !exists[:data].nil?
      course = JSON.parse(response.body, symbolize_names: true)
      student_id = 1 # student = current_user[:uid]
      response = conn("/api/v1/students/#{student_id}").get
      student = JSON.parse(response.body, symbolize_names: true)

      student_course_creation_params = {
        course_id: course[:data][:id].to_i,
        student_id: student[:data][:id].to_i,
        student_points: 0
      }

      response = conn("/api/v1/students/courses").post do |request|
        request.body = student_course_creation_params
      end
      JSON.parse(response.body, symbolize_names: true)
      redirect_to students_courses_path
    else
      # Sad Path
    end
  end

  def destroy
    course_id = params[:id]
    student_id = 1 # student_id = current_user[:uid]
    response = conn("/api/v1/students/#{student_id}").get
    student = JSON.parse(response.body, symbolize_names: true)

    student_course_deletion_params = ({
        course_id: course_id,
        student_id: student[:data][:id].to_i,
        student_points: 0
      })

    response = conn("/api/v1/students/courses/#{course_id}").delete do |request|
      request.body = student_course_deletion_params
    end
    redirect_to students_courses_path
  end

  private

  def student_course_params
    params.permit(:enrollment)
  end
end
