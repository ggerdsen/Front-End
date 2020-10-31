require 'rails_helper'

RSpec.describe 'course edit' do
  def conn(uri)
    url = 'http://localhost:3000' + uri
    Faraday.new(url)
  end

  describe 'edit' do
    it 'can consume an api and edit a course' do
      stub_omniauth
      require "pry"; binding.pry
    end
  end
end
