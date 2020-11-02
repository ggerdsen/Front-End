require 'rails_helper'

RSpec.describe 'Teacher Dashboard' do

  it 'displays all courses for a teacher' do
    visit '/dashboard'
    course1 = "english"
    within('.courses') do
      expect(page).to have_link("#{course1}")
    end

    expect(page).to have_button "Add a New Course"
  end

  it 'adding a new course' do
    visit '/dashboard'

    expect(page).to_not have_link("Latin")

    click_button "Add a New Course"
    fill_in :course_name, with: "Latin"
    click "Submit"

    expect(current_path).to eq("/dashboard")
    within('.courses') do
      expect(page).to have_link("Latin")
    end
  end

  it 'cannot add course without name' do
    visit '/dashboard'

    expect(page).to_not have_link("Latin")

    click_button "Add a New Course"
    click "Submit"

    expect(page).to have_content("Please include a course name")
  end

end
