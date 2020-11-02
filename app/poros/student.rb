class Student
attr_reader :student_id,
            :first_name,
            :last_name,
            :courses,
            :points,
            :poms

  def initialize(student_data, course_data, pom_data)
  
    @student_id = student_data[:id]
    @first_name = student_data[:first_name]
    @last_name = student_data[:last_name]
    @points = student_data[:points]
    @courses = course_data.map do |course|
      Course.new(course)
    end
    @poms = pom_data.map do |pom|
      Pom.new(pom)
    end
  end
end