class Customer
  attr_reader :name, :address
  attr_accessor :id

  def initialize(attribute = {})
    @id = attribute[:id]
    @name = attribute[:name]
    @address = attribute[:address]
  end
end
