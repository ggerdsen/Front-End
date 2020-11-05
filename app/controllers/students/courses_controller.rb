class Students::CoursesController < ApplicationController
  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  def index
    @student = current_user
    response = conn("/api/v1/students/#{@student.id}").get
    student = JSON.parse(response.body, symbolize_names: true)
    student_course_params = {student_id: student[:data][:id].to_i}
    response = conn("/api/v1/students/courses").get do |request|
      request.body = student_course_params
    end
    json = JSON.parse(response.body, symbolize_names: true)
    @courses = json[:data].map do |course_data|
      Course.new(course_data)
    end

    student_course_params = ({
      student_id: @student.id
    })
    response = conn("/api/v1/students/courses/points").get do |request|
      request.body = student_course_params
    end
    point_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @points = point_data.reduce(0) do |total, course|
      total += course[:attributes][:student_points]
    end
    
    @poms = []
  end

  def create
    response = conn("/api/v1/teachers/courses/find?courseCode=#{student_course_params[:enrollment]}").get
    exists = JSON.parse(response.body, symbolize_names: true)

    if !exists[:data].nil?
      course = JSON.parse(response.body, symbolize_names: true)
      @student = current_user
      response = conn("/api/v1/students/#{@student.id}").get
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


  def show
    @student = current_user
    response = Faraday.get("http://localhost:3000/api/v1/students/courses/#{params[:id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)[:data]
    @course = Course.new(course_data)

    teacher_id = @course.teacher_id
    response = Faraday.get("http://localhost:3000/api/v1/teachers/#{teacher_id}")
    teacher_data = JSON.parse(response.body, symbolize_names: true)
    @teacher = Teacher.new(teacher_data)

    student_course_params = ({
      course_id: @course.id,
      student_id: @student.id
    })
    response = conn("/api/v1/students/courses/points").get do |request|
      request.body = student_course_params
    end
    point_data = JSON.parse(response.body, symbolize_names: true)[:data][0]
    @points = point_data[:attributes][:student_points]  
    ### Still need to add Prizes, Poms, and Class Wars
  end

  def destroy
    course_id = params[:id]
    @student = current_user
    student_course_deletion_params = ({
        course_id: course_id,
        student_id: @student.id
      })

    conn("/api/v1/students/courses/#{course_id}").delete do |request|
      request.body = student_course_deletion_params
    end
    redirect_to students_courses_path
  end

  private

  def student_course_params
    params.permit(:enrollment)
  end
end
