class Student
attr_reader :id,
            :provider,
            :uid,
            :email,
            :token,
            :first_name,
            :last_name,
            :courses,
            :points,
            :poms

  def initialize(student_info, course_data = nil, pom_data = nil)
    @id = student_info[:data][:id]
    @provider = student_info[:data][:attributes][:provider]
    @uid = student_info[:data][:attributes][:uid]
    @email = student_info[:data][:attributes][:email]
    @token = student_info[:data][:attributes][:token]

    @first_name = student_info[:attributes][:first_name]
    @last_name = student_info[:attributes][:last_name]
    @points = student_info[:attributes][:points]
    @courses = course_data.map { |course| Course.new(course) } if course_data
  
    @poms = pom_data.map { |pom| Pom.new(pom) } if pom_data
  end
end