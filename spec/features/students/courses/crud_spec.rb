require 'rails_helper'

RSpec.describe 'Students course CRUD' do
  scenario "a logged in student can enroll" do
    stub_omniauth
    # This will need to be updated once we have authorization for student users versus teacher users
    visit students_courses_path
    # EVENTUALLY, we need to update for dynamic since this test won't pass on anyone elses local
        # faraday call on a teacher, on their course, who are their students?
    #Priya's postico
    # Student id 4
    # Has courses:
    # 8 Health Science wu07y8kz teacher 4
    # 12 Biomedical Science mu83vu1b teacher 6
    # courses 21-24 are courses that aren't enrolled in by students 1-20
    # 21 Business fvwcsruy teacher 11

    course_name = 'Business'
    course_code = 'fvwcsruy'

    # SARYN RESEED!!!!
    #Saryn's postico (PLEASE RESEEED!!!)
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
    #Priya's postico
    # Student id 4
    # Has courses:
    # 8 Health Science wu07y8kz teacher 4
    # 12 Biomedical Science mu83vu1b teacher 6
    # courses 21-24 are courses that aren't enrolled in by students 1-20
    # 21 Business fvwcsruy teacher 11
    course1_name = 'Health Science'
    course2_name = 'Biomedical Science'


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

  scenario 'student can unenroll from a course' do
    stub_omniauth
    visit students_courses_path
    #Priya's postico
    # Student id 4
    # Has courses:
    # 8 Health Science wu07y8kz teacher 4
    # 12 Biomedical Science mu83vu1b teacher 6
    # courses 21-24 are courses that aren't enrolled in by students 1-20
    # 21 Business fvwcsruy teacher 11
    # 23 Education q875qj94

    course1_name = 'Health Science'
    course1_id = 8
    course1_course_code = 'wu07y8kz'
    course2_name = 'Biomedical Science'

    within '#my-classes' do
      expect(page).to have_content(course1_name)
      expect(page).to have_content(course2_name)
    end

    within '#my-classes' do
      within "#class-#{course1_id}" do
        click_on 'Unenroll in Course'
      end
    end
    expect(current_path).to eq(students_courses_path)

    within '#my-classes' do
      expect(page).to_not have_content(course1_name)
      expect(page).to have_content(course2_name)
    end

    # Put it back in the database
    fill_in :enrollment, with: course1_course_code
    click_on 'Add Course'
    expect(current_path).to eq(students_courses_path)
  end
end
