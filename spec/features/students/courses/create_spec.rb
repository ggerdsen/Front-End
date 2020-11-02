require 'rails_helper'

RSpec.describe 'Student enrolls in a course' do
  scenario "as a logged in student" do
    stub_omniauth
    # This will need to be updated once we have authorization for student users versus teacher users
    visit students_courses_path
    # EVENTUALLY, we need to update for dynamic since this test won't pass on anyone elses local
        # faraday call on a teacher, on their course, who are their students?

    # course = id 10, Arts name
    # teacher id 4 Rubi Feest
    course_name = 'Arts'
    class_code = 'n5d7j7hb'
    within '#my-classes' do
      expect(page).to_not have_content(course_name)
    end

    fill_in :enrollment, with: class_code
    click_on 'Add Course'
    expect(current_path).to eq(students_courses_path)
    within '#my-classes' do
      expect(page).to have_content(course_name)
    end
  end

  scenario "as a not registered in student user" do
  end
end
