class Course
  attr_reader :name,
  :course_code,
  :school_name
  
  def initialize(course_data)
    @name = course_data[:name]
    @course_code = course_data[:name]
    @school_name = course_data[:school_name]
  end
end