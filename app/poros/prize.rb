class Prize
  attr_reader :id,
              :name,
              :prize_points,
              :course_id

  def initialize(attrs)
    @id = attrs[:id].to_i
    @name = attrs[:attributes][:name]
    @prize_points = attrs[:attributes][:prize_points]
    @course_id = attrs[:relationships][:course][:data][:id]
  end
end
