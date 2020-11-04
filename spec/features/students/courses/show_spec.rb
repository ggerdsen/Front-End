require 'rails_helper'

RSpec.describe 'Student Course Dashboard' do
  describe 'As a student' do
    # before :each do
    #   student_data = {attributes: {id: 1, first_name: "Little Timmy", last_name: "Boy", points: 134}}
      
    #   course_data = [{attributes:{name: "Geometry", course_code: '1', school_name: 'HomeSkool'}}, {attributes:{name: "Calculus", course_code: '2', school_name: 'HomeSkool'}}, {attributes:{name: "Physics", course_code: '3', school_name: 'HomeSkool'}}]
      
    #   pom_data =  [{attributes:{id: '1', name: 'Fishy Time', description: "Feeding the goldfish", duration: '2 minutes', link: 'www.breadfish.uk'}}, {attributes:{id: '2', name: 'Kegerator', description: "Doing kegstands", duration: 'as long as you can hold', link: 'www.helpme.io'}}]
      
    #   @student_user = Student.new(student_data, course_data, pom_data)
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@student_user)
    # end

    scenario 'a teacher can view a single courses show page' do
      stub_student_omniauth
      visit students_courses_path
      student_params = ({student_id: 1})
      response = Faraday.get('http://localhost:3000/api/v1/students/courses') do |request|
        request.body = student_params
      end
      course = JSON.parse(response.body, symbolize_names: true)
      course_name = course[:data][0][:attributes][:name]
      course_id = course[:data][0][:id]
      within '#my-courses' do
        within "#course-#{course_id}" do
          click_on 'Course Show Page'
        end
      end
      course2_name = course[:data][1][:attributes][:name]
      course2_id = course[:data][1][:id]
      expect(current_path).to eq("/teachers/courses/#{course_id}")
      expect(page).to have_content(course_name)
      expect(page).to_not have_content(course2_name)
      expect(page).to have_content("Physics")
    end
  end
end