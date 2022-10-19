class Meal
  attr_reader :price
  attr_accessor :id, :name

  def initialize(attribute = {})
    @id = attribute[:id]
    @name = attribute[:name]
    @price = attribute[:price]
  end

  def self.header
    ['id', 'name', 'price']
  end

  def build_row
    [id, name, price]
  end
end
