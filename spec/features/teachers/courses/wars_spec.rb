require 'rails_helper'

RSpec.describe 'Teacher Wars' do
  scenario 'a teacher can create and destroy a war' do
    stub_teacher_omniauth
    visit root_path
    choose(option: 'teachers')
    click_on "Sign in with Google"
    expect(current_path).to eq(teachers_courses_path)

    challenger = TeacherFacade.find(stub_teacher_omniauth[:uid])
    challenger_params = ({teacher_id: challenger.id})
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses') do |request|
      request.body = challenger_params
    end
    challenger_courses = JSON.parse(response.body, symbolize_names: true)[:data]

    opponent_params = ({teacher_id: 5})
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses') do |request|
      request.body = opponent_params
    end
    opponent_courses = JSON.parse(response.body, symbolize_names: true)[:data]

    war_params = ({
      teacher_id: challenger.id,
      challenger_course_id: challenger_courses[0][:attributes][:course_id],
      opponent_course_id: opponent_courses[0][:attributes][:course_id],
      challenger_course_points: challenger_courses[0][:attributes][:course_points],
      opponent_course_points: opponent_courses[0][:attributes][:course_points]
    })

    within '#my-wars' do
      expect(page).to_not have_content(war_params[:opponent_course_points])
    end

    within "#course-#{challenger_courses[0][:id]}" do
      fill_in :opponent_course_code, with: opponent_courses[0][:attributes][:course_code]
      click_on 'Create War'
    end
    expect(current_path).to eq(teachers_courses_path)

    within '#my-wars' do
      expect(page).to have_content(war_params[:opponent_course_points])
    end

    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses/wars') do |request|
      request.body = challenger_params
    end
    war = JSON.parse(response.body, symbolize_names: true)[:data].last
    within '#my-wars' do
      expect(page).to have_content(war[:attributes][:opponent_course_points])
    end

    # DESTROY THE WAR
    within "#war-#{war[:id]}" do
      click_on 'Delete this War'
    end
    expect(current_path).to eq(teachers_courses_path)
    within '#my-wars' do
      expect(page).to_not have_content(war[:attributes][:opponent_course_points])
    end
  end
end
