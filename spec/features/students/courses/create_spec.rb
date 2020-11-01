require 'rails_helper'

RSpec.describe 'Student enrolls in a course' do
  scenario "as a logged in student" do
    stub my user
    visit my dashboard?
        # Error because no-dashboard routing (we can ask Corey, Tyler, thems for their code)
        # Route errors ask corey
        # Controller errors ask corey
        # View error ask corey
        # Add a button for "Adding a course"
    click add a class/course
      # Our route/controller/view errors, follow
    redirected to a form for class code
      # This will require confirming class codes in postico
    submit
      # Follow the errors
    redirected back to dashboard and see course
      # Follow the errors
    expect dashboard to have course name in the my classes section
  end

  scenario "as a not registered in student user" do
  end
end
