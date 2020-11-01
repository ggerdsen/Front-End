class Course
  attr_reader :name,
              :id,
              :students,
              :teacher_id

  def initialize(attrs)
    @name = attrs[:data][:attributes][:name]
    @id = attrs[:data][:id]
    @students = parse_students(attrs[:data][:attributes][:students][:data])
    @teacher_id = attrs[:data][:relationships][:teacher][:data][:id]
  end

  def parse_students(students_data)
    students_data.map do |student|
      student[:attributes][:name]
    end.sort
  end
end
