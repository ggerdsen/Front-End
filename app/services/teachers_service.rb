class TeachersService
  def self.conn(uri)
    url = ENV['CLASS_WARS_DOMAIN'] + uri
    Faraday.new(url)
  end

  def self.get_all_courses(teacher)
    teacher_course_params = {teacher_id: teacher[:data][:id].to_i}
    response = conn("/api/v1/teachers/courses").get do |request|
      request.body = teacher_course_params
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_teacher(id)
    response = conn("/api/v1/teachers/#{id}").get
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_course(data, id)
    response = conn("/api/v1/teachers/courses/#{id}").post do |request|
      request.body = data
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.edit_course(id)
    response = conn("/api/v1/teachers/courses/#{id}").get
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.update_course(id, data)
    response = conn("/api/v1/teachers/courses/#{id}").patch do |request|
      request.body = data
    end
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.destroy_course(id)
    conn("/api/v1/teachers/courses/#{id}").delete
  end
end
