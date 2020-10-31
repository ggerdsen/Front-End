require 'rails_helper'

# mock a teacher user
# mock a course for that teacher
# update a course
# see the updated course on dashboard

RSpec.describe 'Teacher edits a course' do
  def conn(uri)
    url = 'http://localhost:3000' + uri
    Faraday.new(url)
  end

  scenario "using google oauth2" do
    stub_omniauth
    binding.pry
    response = conn('/api/v1/teachers/courses/edit').get
  end
end
