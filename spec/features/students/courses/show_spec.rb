require 'rails_helper'

RSpec.describe 'Student Dashboard' do
  describe 'As a student' do
    before :each do
      student_data = {attributes: {id: 1, first_name: "Little Timmy", last_name: "Boy", points: 134}}
      
      course_data = [{attributes:{name: "Geometry", course_code: '1', school_name: 'HomeSkool'}}, {attributes:{name: "Calculus", course_code: '2', school_name: 'HomeSkool'}}, {attributes:{name: "Physics", course_code: '3', school_name: 'HomeSkool'}}]
      
      pom_data =  [{attributes:{id: '1', name: 'Fishy Time', description: "Feeding the goldfish", duration: '2 minutes', link: 'www.breadfish.uk'}}, {attributes:{id: '2', name: 'Kegerator', description: "Doing kegstands", duration: 'as long as you can hold', link: 'www.helpme.io'}}]
      
      @student_user = Student.new(student_data, course_data, pom_data)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@student_user)
    end
    it 'I can see all of my courses' do
      visit '/students/courses/3'
      save_and_open_page
      expect(page).to have_content("Physics")
      # expect(page).to have_button("Calculus")
      # expect(page).to have_button("Physics")
      # expect(page).to have_link("Fishy Time")
      # expect(page).to have_link("Kegerator")
      # expect(page).to have_content("134")
    end
  end
end