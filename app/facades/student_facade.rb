class StudentFacade
  def self.find(uid)
    response = Faraday.get("http://localhost:3000/api/v1/find/#{uid}")

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    Student.new(parsed_data)
  end
end
