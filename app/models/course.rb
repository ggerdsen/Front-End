class Course
  attr_reader :id,
              :name,
              :course_code,
              :school_name,
              :teacher_id,
              :course_points

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:attributes][:name]
    @course_code = attrs[:attributes][:course_code]
    @school_name = attrs[:attributes][:school_name]
    @teacher_id = attrs[:attributes][:teacher_id]
    @course_points = attrs[:attributes][:course_points]
  end
end
