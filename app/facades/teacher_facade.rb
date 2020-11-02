class TeacherFacade
  def self.find(uid)
    response = Faraday.get("http://localhost:3000/api/v1/find/#{uid}")

    parsed_data = JSON.parse(response.body, symbolize_names: true)
    
    Teacher.new(parsed_data)
  end
end
