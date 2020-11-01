require 'rails_helper'

RSpec.describe 'As a teacher' do
  describe 'When I visit a course roster page, using google oauth2' do
    before :each do
      response = Faraday.get('http://localhost:3000/api/v1/teachers/courses')
      courses = JSON.parse(response.body, symbolize_names: true)
      @course = courses[:data].first
      stub_omniauth
      visit "/teachers/courses/#{@course[:id]}/roster"
    end

    it "I see the course name and a roster of course's students" do

      expect(page).to have_content("#{@course[:attributes][:name]}")
      expect(page).to have_content('Roster')

      within '#student-roster' do
        expect(page).to have_css('ul', :count => 20)
      end
    end

    it "I see a button that returns me to the course show page" do
      click_button 'Return to Course Page'

      expect(current_path).to eq("/teachers/courses/#{@course[:id]}")
    end

    it "I see a button that returns me to the teacher home page" do
      click_button 'Return to Teacher Dashboard'

      expect(current_path).to eq("/teachers/#{@course[:relationships][:teacher][:data][:id]}")
    end

    describe "I see a form to add a student to the course" do
      it "has fields for a student's name and email" do
        within '#add-student-form' do
          page.has_field?("New Student's Name")
          page.has_field?("New Student's Email")
          page.has_button?("Add Student")
        end
      end
    end
  end
end
