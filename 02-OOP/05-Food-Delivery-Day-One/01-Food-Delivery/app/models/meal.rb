class Meal
  attr_reader :price
  attr_accessor :id, :name

  def initialize(attribute = {})
    @id = attribute[:id]
    @name = attribute[:name]
    @price = attribute[:price]
  end
end
