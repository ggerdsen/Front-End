class Student
  def self.find(uid)
    response = Faraday.get("http://localhost:3000/api/v1/find/#{uid}")
  end
end
