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

  describe 'edit and delete' do
    it 'can consume an api and edit a course' do
      response = Faraday.get('http://localhost:3000/api/v1/teachers/courses')
      courses = JSON.parse(response.body, symbolize_names: true)
      course = courses[:data].first

      stub_omniauth
      name = 'Criminal Psychology'
      course_code = 2763
      school_name = 'Vertapple University'

      body = {
        name: name,
        course_code: course_code,
        school_name: school_name
      }

      response = conn("/api/v1/teachers/courses/#{course[:id]}").patch do |request|
        request.body = body
      end
      json = JSON.parse(response.body, symbolize_names: true)
      course = json[:data][0]

      expect(course[:attributes][:name]).to eq(name)
      expect(course[:attributes][:course_code]).to eq(course_code)
      expect(course[:attributes][:school_name]).to eq(school_name)
    end

    it 'can create and delete a course' do
      #create
      stub_omniauth
      name = 'Couseling Theories'
      course_code = 1234
      school_name = 'Whitworth'

      body = {
        name: name,
        course_code: course_code,
        school_name: school_name
      }

      response = conn('/api/v1/teachers/courses').post do |request|
        request.body = body
      end

      json = JSON.parse(response.body, symbolize_names: true)
      require "pry"; binding.pry
    end
  end
end
