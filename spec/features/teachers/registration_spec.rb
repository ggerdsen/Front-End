# require 'rails_helper'
#
# describe "Teacher Registration" do
#   it 'can request school_name and school_district from teacher' do
#     uid = 102
#     response = File.read("./spec/fixtures/teacher_registration.json")
#     stub_request(:get, "https://git.heroku.com/polar-anchorage-12813.git/api/v1/teachers/find/#{uid}").to_return(status: 200, body: response, headers: {})
#
#     teacher = TeacherFacade.find(uid)
#
#     visit '/teacher/courses'
#     save_and_open_page
#     within '.teacher_school_info' do
#       fill_in :school_name, with: 'Jose De Diego'
#       fill_in :school_district, with: 'Humboldt Park'
#     end
#     click_button 'Submit'
#
#     expect(current_path).to eq('/teacher/courses')
#
#     expect(page).to have_content("School name: Jose De Diego")
#     expect(page).to have_content("School district: Humboldt Park")
#
#   end
# end
