require 'rails_helper'

RSpec.describe 'Teacher edits a course' do
  scenario "using google oauth2" do
    response = Faraday.get('http://localhost:3000/api/v1/teachers/courses')
    courses = JSON.parse(response.body, symbolize_names: true)
    course = courses[:data].first

    stub_omniauth

    visit "/teachers/courses/#{course[:id]}"

    expect(page).to have_content("#{course[:attributes][:name]}")
    expect(page).to have_button('Edit Course')

    click_button('Edit Course')
    fill_in 'Name', with: 'Social Studies'

    click_button('Update Course')
    save_and_open_page
  end
end
