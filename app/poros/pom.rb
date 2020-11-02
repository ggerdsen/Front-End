class Pom
  attr_reader :name,
  :description,
  :duration,
  :link,
  :id
  
  def initialize(pom_data)
    @name = pom_data[:name]
    @description = pom_data[:description]
    @duration = pom_data[:duration]
    @link = pom_data[:link]
    @id = pom_data[:id]
  end
end