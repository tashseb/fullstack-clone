class Order
  def initialize(attribute = {})
    @id = attribute[:id]
    @meal = attribute[:meal]
    @customer = attribute[:customer]
    @employee = attribute[:employee]
    @delivered = attribute[:delivered] || false
  end
end
