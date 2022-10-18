class Meal
  attr_reader :id, :name, :price
  def initialize(attribute = {})
    @id = attribute[:id]
    @name = attribute[:name]
    @price = attribute[:price]
  end

  def id=(id)
    @id = id
  end
end
