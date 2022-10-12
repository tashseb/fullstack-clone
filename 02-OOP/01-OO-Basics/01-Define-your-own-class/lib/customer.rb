class Customer
  @no_of_customers = 0
  def initialize(id, name, age)
    @no_of_customers += 1
    @cust_id = id
    @cust_name = name
    @cust_age = age
  end

  def display_info
    puts "Customer id: #{@cust_id}"
    puts "Customer id: #{@cust_name}"
    puts "Customer id: #{@cust_age}"
  end

  def total_no_customers
    puts "Total number of customers: #{@no_of_customers}"
  end
end
