require 'rails_helper'

RSpec.describe "teacher login" do
  describe "using google oauth2" do
    it "allows teacher to login" do
      VCR.use_cassette("google_oauth2_teacher", allow_playback_repeats: true) do
        visit root_path

        stub_teacher_omniauth

        choose(option: 'teachers')

        click_on "Sign in with Google"

        expect(page).to have_content("Berneice")
        expect(page).to have_button("Log Out")
        expect(current_path).to eq("/teacher/courses")
      end
    end

    it "allows student to logout" do
      VCR.use_cassette("google_oauth2_teacher", allow_playback_repeats: true) do
        visit root_path

        stub_teacher_omniauth

        choose(option: 'teachers')

        click_on "Sign in with Google"

        expect(current_path).to eq("/teacher/courses")

        click_button "Log Out"

        expect(current_path).to eq(root_path)
      end
    end
  end
end
