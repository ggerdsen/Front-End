class War
  attr_reader :id,
              :challenger_course_id,
              :opponent_course_id,
              :challenger_course_points,
              :opponent_course_points
              
  def initialize(attrs)
    @id = attrs[:id]
    @challenger_course_id = attrs[:attributes][:challenger_course_id]
    @opponent_course_id = attrs[:attributes][:opponent_course_id]
    @challenger_course_points = attrs[:attributes][:challenger_course_points]
    @opponent_course_points = attrs[:attributes][:opponent_course_points]
  end
end
