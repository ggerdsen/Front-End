require 'rails_helper'

RSpec.describe 'Students course CRUD' do
  scenario 'a student can see their dashboard (index action for courses)' do
    # stub_omniauth_student
    stub_omniauth
    visit students_courses_path
    # student_params = ({student_id: current_user[:uid]})
    student_params = ({student_id: 1})
    response = Faraday.get('http://localhost:3000/api/v1/students/courses') do |request|
      request.body = student_params
    end
    my_courses = JSON.parse(response.body, symbolize_names: true)
    course1_name = my_courses[:data][0][:attributes][:name]

    student_params = ({student_id: 2})
    response = Faraday.get('http://localhost:3000/api/v1/students/courses') do |request|
      request.body = student_params
    end
    not_my_courses = JSON.parse(response.body, symbolize_names: true)
    course2_name = not_my_courses[:data][0][:attributes][:name]

    within '#my-courses' do
      expect(page).to have_content(course1_name)
      expect(page).to_not have_content(course2_name)
    end
  end

  scenario "a student can enroll and disenroll in a course" do
    # stub_omniauth_student
    stub_omniauth
    visit students_courses_path

    # student_params = ({student_id: current_user[:uid]})
    student_params = ({student_id: 1})
    response = Faraday.get('http://localhost:3000/api/v1/students/courses') do |request|
      request.body = student_params
    end
    my_courses = JSON.parse(response.body, symbolize_names: true)
    course1_name = my_courses[:data][0][:attributes][:name]

    student_params = ({student_id: 2})
    response = Faraday.get('http://localhost:3000/api/v1/students/courses') do |request|
      request.body = student_params
    end
    not_my_courses = JSON.parse(response.body, symbolize_names: true)
    course2_id = not_my_courses[:data][0][:id]
    course2_name = not_my_courses[:data][0][:attributes][:name]
    course2_code = not_my_courses[:data][0][:attributes][:course_code]

    within '#my-courses' do
      expect(page).to have_content(course1_name)
      expect(page).to_not have_content(course2_name)
    end

    # CREATE
    within '#add-course' do
      fill_in :enrollment, with: course2_code
      click_on 'Enroll in Course'
    end
    expect(current_path).to eq(students_courses_path)
    within '#my-courses' do
      expect(page).to have_content(course1_name)
      expect(page).to have_content(course2_name)
    end

    # DESTROY
    within '#my-courses' do
      within "#course-#{course2_id}" do
        click_on 'Unenroll in Course'
      end
    end
    expect(current_path).to eq(students_courses_path)
    within '#my-courses' do
      expect(page).to have_content(course1_name)
      expect(page).to_not have_content(course2_name)
    end
  end

  scenario "as a not registered in student user" do
    # get a 404 error
  end

  scenario "as a registered student user I should not be able to enroll in the same course more than once" do
    # Needs a block in BE student:courses controller in the create action to check if it is already in the database
  end
end
