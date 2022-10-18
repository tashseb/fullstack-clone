class Customer
  def initialize(attribute = {})
    @id = attribute[:id]
    @name = attribute[:name]
    @address = attribute[:address]
  end
end
