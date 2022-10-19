require_relative '../repositories/customer_repository'
require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    display_list
  end

  def find
    display_list
    @customer_repository.find(@customers_view.find_customer_by_id)
  end

  def add
    cust_name = @customers_view.add_name
    cust_address = @customers_view.add_address
    customer = Customer.new(name: cust_name, address: cust_address)
    @customer_repository.create(customer)
  end

  private

  def display_list
    @customers_view.display_customer(@customer_repository.all)
  end
end
