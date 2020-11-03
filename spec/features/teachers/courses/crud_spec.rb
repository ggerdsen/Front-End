require 'rails_helper'

RSpec.describe 'Teachers course CRUD' do
  scenario "a teacher can see their dashboard (index action)" do
    # stub_omniauth_teacher
    stub_omniauth
    visit teachers_courses_path

    # teacher_params = ({teacher_id: current_user[:uid]})
    teacher_params = ({teacher_id: 1})
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses') do |request|
      request.body = teacher_params
    end
    my_courses = JSON.parse(response.body, symbolize_names: true)
    course1_name = my_courses[:data][0][:attributes][:name]
    course2_name = my_courses[:data][0][:attributes][:name]

    teacher_params = ({teacher_id: 2})
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses') do |request|
      request.body = teacher_params
    end
    not_my_courses = JSON.parse(response.body, symbolize_names: true)
    course3_name = not_my_courses[:data][0][:attributes][:name]

    within '#my-courses' do
      expect(page).to have_content(course1_name)
      expect(page).to have_content(course2_name)
      expect(page).to_not have_content(course3_name)
    end
  end

  scenario "a teacher can create and destroy courses on their dashboard " do
    stub_omniauth
    # stub_omniauth_teacher
    visit teachers_courses_path

    teacher_course_params = {
      name: "Band 101",
      school_name: "Jim Bob's Happy House"
      }

    within '#my-courses' do
      expect(page).to_not have_content(teacher_course_params[:name])
    end

    within '#add-courses' do
      fill_in :name, with: teacher_course_params[:name]
      fill_in :school_name, with: teacher_course_params[:school_name]
      click_on 'Add Course'
    end

    expect(current_path).to eq(teachers_courses_path)

    within '#my-courses' do
      expect(page).to have_content(teacher_course_params[:name])
    end

    # Chris's postico courses end at 24, so this created course would be id 25
    teacher_params = ({teacher_id: 1})
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses') do |request|
      request.body = teacher_params
    end
    courses = JSON.parse(response.body, symbolize_names: true)
    course1_id = courses[:data].last[:id]
    within '#my-courses' do
      within "#course-#{course1_id}" do
        click_on 'Remove Course'
      end
    end
    expect(current_path).to eq(teachers_courses_path)

    within '#my-courses' do
      expect(page).to_not have_content(teacher_course_params[:name])
    end
  end
end
