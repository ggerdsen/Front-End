require 'rails_helper'

RSpec.describe 'Teachers course CRUD' do
  scenario "a teacher can see their dashboard (index action)" do
    stub_omniauth
    # stub_omniauth_teacher
    visit teachers_courses_path
    # Priyas Postico
    # LOOK IN POSTICO FOR A TEACHER
    # id = 1 teacher name = Joi
    # courses:
    # id = 1 course name = Nursing kww7s7t5
    # id = 2 course name = Law 9dr7b6q4

    course1_name = 'Nursing'
    course2_name = 'Law'

    within '#my-courses' do
      expect(page).to have_content(course1_name)
      expect(page).to have_content(course2_name)
    end
  end
  # 
  # scenario "a teacher can create and destroy a course" do
  #   stub_omniauth
  #   #stub_omniauth_teacher
  #   visit teachers_courses_path
  # end
  #
  # scenario "a teacher can edit a course"
end
