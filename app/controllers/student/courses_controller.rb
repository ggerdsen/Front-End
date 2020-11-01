class Student::CoursesController < ApplicationController
  def index
    # response = Faraday.get("BACKEND URI")
    # courses_data = JSON.parse(response.body, symbolize_names: true)
    # @courses = courses_data[:data].map do |course_data|
    #   Course.new(course_data)
    # end
    @current_user = {id: 1, first_name: "Little Timmy", last_name: "Boy", courses: ["Geometry", "Calculus", "Physics"]}
  end
end