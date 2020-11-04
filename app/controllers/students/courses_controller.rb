class Students::CoursesController < ApplicationController
  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  def index
    current_user
    # @student = current_user
    student_id = 4
    # From postico (priyas local), student 4 is who we are using "Cinthia"
    # From postico (Saryn's local), student 4 is who grabbed (Fidel Ryan DDS)
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
    # NEED TO CALL OUR COURSES
    # @courses = sdlkfsldfkjsdlfkj

    # response = Faraday.get("BACKEND URI")
    # courses_data = JSON.parse(response.body, symbolize_names: true)
    # @courses = courses_data[:data].map do |course_data|
    #   Course.new(course_data)
    # end
  end

  def create
    # what comes through should be the course code
    response = conn("/api/v1/teachers/courses/find?courseCode=#{student_course_params[:enrollment]}").get

    exists = JSON.parse(response.body, symbolize_names: true)

    if !exists[:data].nil?
      course = JSON.parse(response.body, symbolize_names: true)
      # EVENTUALLY, we will need to update for use of current_user for student.id
      # student = current_user
      # response = conn("/api/v1/students/#{student.id}").get

      student_id = 4
        # From postico (priyas local), student #20 is who we are using "Gala Schamberger"
        # From postico (Saryn's local), student 4 is who grabbed (Fidel Ryan DDS)
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
      student_course_data = JSON.parse(response.body, symbolize_names: true)
      redirect_to students_courses_path
    else
      # Sad Path
    end
  end

  
  def show
    current_user
    response = Faraday.get("http://localhost:3000/api/v1/students/courses/#{params[:id]}")
    
    course_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @course = Course.new(course_data)
  end

  def destroy
    course_id = params[:id]
    student_id = 4 # will be current user id eventually
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
    deletion = JSON.parse(response.body, symbolize_names: true)
    redirect_to students_courses_path
  end

  private

  def student_course_params
    params.permit(:enrollment)
  end
end
