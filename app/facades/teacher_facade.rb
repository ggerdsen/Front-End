class TeacherFacade
  def self.find(uid)
    response = Faraday.get("https://git.heroku.com/polar-anchorage-12813.git/api/v1/teachers/find/#{uid}")

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    Teacher.new(parsed_data)
  end
end
