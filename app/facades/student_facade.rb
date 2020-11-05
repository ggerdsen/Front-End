class StudentFacade
  def self.find(uid)
    response = Faraday.get("https://git.heroku.com/polar-anchorage-12813.git/api/v1/students/find/#{uid}")
    parsed_data = JSON.parse(response.body, symbolize_names: true)
    Student.new(parsed_data)
  end
end
