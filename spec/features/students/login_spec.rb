require 'rails_helper'

RSpec.describe "student login" do
  describe "using google oauth2" do
    it "allows student to login" do
      VCR.use_cassette("google_oauth2", allow_playback_repeats: true) do
        visit root_path

        stub_student_omniauth

        choose(option: 'students')

        click_on "Sign in with Google"

        expect(page).to have_content("John")
        expect(page).to have_button("Log Out")
        expect(current_path).to eq("/student/courses")
      end
    end

    it "allows student to logout" do
      VCR.use_cassette("google_oauth2", allow_playback_repeats: true) do
        visit root_path

        stub_student_omniauth

        choose(option: 'students')

        click_on "Sign in with Google"

        expect(current_path).to eq("/student/courses")

        click_button "Log Out"

        expect(current_path).to eq(root_path)
      end
    end
  end
end
