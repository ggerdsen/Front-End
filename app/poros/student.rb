class Student
  attr_reader :id,
              :provider,
              :uid,
              :email,
              :token,
              :first_name,
              :last_name

  def initialize(student_info)
    @id = student_info[:data][:id]
    @provider = student_info[:data][:attributes][:provider]
    @uid = student_info[:data][:attributes][:uid]
    @email = student_info[:data][:attributes][:email]
    @token = student_info[:data][:attributes][:token]
    @first_name = student_info[:data][:attributes][:first_name]
    @last_name = student_info[:data][:attributes][:last_name]
  end
end
