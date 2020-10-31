class Course
  attr_reader :name,
              :id

  def initialize(attrs)
    @name = attrs[:data][0][:attributes][:name]
    @id = attrs[:data][0][:id]
  end
end
