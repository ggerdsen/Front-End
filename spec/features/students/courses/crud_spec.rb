require 'rails_helper'

RSpec.describe 'Students course CRUD' do
  scenario "a logged in student can enroll" do
    stub_omniauth
    # This will need to be updated once we have authorization for student users versus teacher users
    visit students_courses_path
    # EVENTUALLY, we need to update for dynamic since this test won't pass on anyone elses local
        # faraday call on a teacher, on their course, who are their students?
    #Priya's postico
    # course = id 10, Arts name
    # teacher id 4 Rubi Feest
    # course_name = 'Arts'
    # class_code = 'n5d7j7hb'
    # courses 16-24 are courses that aren't enrolled in by students 1-20
    # course = id 17, "Communications" which is not a faker course that was created in 1-15
    course_name = 'Communications'
    course_code = '571bup4q'

    #Saryn's postico
    #course = id 12, Health Science
    #teacher id = 4 Philip Kuhlman
    # course_name = 'Health Science'
    # course_code = 'pmme9jr3'


    within '#my-classes' do
      expect(page).to_not have_content(course_name)
    end

    fill_in :enrollment, with: course_code
    click_on 'Add Course'
    expect(current_path).to eq(students_courses_path)
    within '#my-classes' do
      expect(page).to have_content(course_name)
    end
    # YOU WILL NEED TO DELETE YOUR LAST COURSESTUDENT RECORD EVERY TIME UNTIL WE CAN UPDATE WITH A DESTROY ACTION IN THE NEXT BRANCH
  end

  scenario "as a not registered in student user" do
    # get a 404 error
  end

  scenario "as a registered student user I should not be able to enroll in the same course more than once" do
    # Needs a block in BE student:courses controller in the create action to check if it is already in the database
  end

  scenario 'student can view (on dashboard) all courses they are currently enrolled in' do
    stub_omniauth
    # This will need to be updated once we have authorization for student users versus teacher users
    visit students_courses_path
    # EVENTUALLY, we need to update for dynamic since this test won't pass on anyone elses local
        # faraday call on a teacher, on their course, who are their students?
    # Priya's postico
    # course = id 10, Arts name
    # teacher id 4 Rubi Feest
    # course = id 11, Nursing name
    course1_name = 'Architectural Technology'
    #'zwijczf3'
    # course = id 12
    course2_name = 'Medicine'
    #'ntivka4p'


    # Saryn's postico
    # #course = id 12, Health Science
    # #teacher id = 4 Philip Kuhlman
    # course1_name = 'Architectural Technology'
    # #'zwijczf3'
    # course2_name = 'Biological Science'
    # #'dvnsocqu'

    within '#my-classes' do
      expect(page).to have_content(course1_name)
      expect(page).to have_content(course2_name)
    end
  end
end
