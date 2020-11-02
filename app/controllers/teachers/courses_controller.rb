class Teachers::CoursesController < ApplicationController
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
