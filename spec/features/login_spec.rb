require 'rails_helper'

RSpec.describe 'User Logs In' do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    choose(option: 'students')
    # expect(page).to have_link("Sign in with Google")
    click_on "Sign in with Google"
    expect(page).to have_content("John")
    expect(page).to have_content("Smith")
    expect(page).to have_link("Logout")
  end
end
