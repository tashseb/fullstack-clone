class Order
  attr_accessor :id, :delivered
  attr_reader :meal, :customer, :employee

  def initialize(attribute = {})
    @id = attribute[:id]
    @meal = attribute[:meal]
    @customer = attribute[:customer]
    @employee = attribute[:employee]
    @delivered = attribute[:delivered] || false
  end

  def self.header
    ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
  end

  def build_row
    p meal
    [id, delivered, meal.id, customer.id, employee.id]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

end
