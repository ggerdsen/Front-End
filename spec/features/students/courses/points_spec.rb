require 'rails_helper'

RSpec.describe 'Student Points' do
  scenario 'a student can see their points on their dashboard (index action for courses)' do
    stub_student_omniauth
    visit root_path
    choose(option: 'students')
    click_on "Sign in with Google"

    expect(current_path).to eq(students_courses_path)
    student = StudentFacade.find(stub_student_omniauth[:uid])

    student_params = ({student_id: student.id})
    response = Faraday.get('http://localhost:3000/api/v1/students/courses') do |request|
      request.body = student_params
    end

    my_courses = JSON.parse(response.body, symbolize_names: true)
    course1_id = my_courses[:data][0][:id]

    # course_params = ({student_id: 2})
    joins_params = ({student_id: student.id, course_id: course1_id})
    response = Faraday.get('http://localhost:3000/api/v1/students/courses/points') do |request|
      request.body = joins_params
    end
require "pry"; binding.pry
    within '#my-courses' do
      # expect(page).to have_button(course1_name)
      # expect(page).to_not have_button(course2_name)
    end
  end
end
