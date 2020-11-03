class Teachers::CoursesController < ApplicationController
  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  def index
    # Priyas Postico
    teacher_id = 1
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

  def show
    response = Faraday.get("http://localhost:3000/api/v1/teachers/courses/#{params[:id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)
    @course = Course.new(course_data)
  end

  def edit
    response = Faraday.get("http://localhost:3000/api/v1/teachers/courses/#{params[:id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)

    @course = Course.new(course_data)
  end

  def update
    response = conn("/api/v1/teachers/courses/#{params[:id]}").patch do |request|
      request.body = course_params.to_h
    end
    # response = Faraday.patch("http://localhost:3000/api/v1/teachers/courses/#{course_params[:course_id]}")
    course_data = JSON.parse(response.body, symbolize_names: true)
    @course = Course.new(course_data)
  end

  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  private

  def course_params
    params.permit(:name)
  end
end
