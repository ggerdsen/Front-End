require 'rails_helper'
RSpec.describe 'Prize' do
  scenario 'prizes index' do
    stub_teacher_omniauth
    visit root_path
    choose(option: 'teachers')
    click_on "Sign in with Google"
    expect(current_path).to eq(teachers_courses_path)

    teacher = TeacherFacade.find(stub_teacher_omniauth[:uid])
    teacher_params = ({teacher_id: teacher.id})
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses/all-prizes') do |request|
      request.body = teacher_params
    end
    my_prizes = JSON.parse(response.body, symbolize_names: true)[:data]
    within '#my-prizes' do
      expect(page).to have_content(my_prizes[0][:attributes][:name])
      expect(page).to have_content(my_prizes[0][:attributes][:prize_points])
      expect(page).to have_content(my_prizes[1][:attributes][:name])
      expect(page).to have_content(my_prizes[1][:attributes][:prize_points])
      expect(page).to have_content(my_prizes[2][:attributes][:name])
      expect(page).to have_content(my_prizes[2][:attributes][:prize_points])
    end
  end
end
