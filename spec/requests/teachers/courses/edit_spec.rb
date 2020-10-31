require 'rails_helper'

# mock a teacher user
# mock a course for that teacher
# update a course
# see the updated course on dashboard

RSpec.describe 'Teacher edits a course' do
  def conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  describe 'edit' do
    it 'can consume an api and edit a course' do
      stub_omniauth
      response = conn('/api/v1/teachers/courses/18/edit').patch
      require "pry"; binding.pry

    end
  end
end
