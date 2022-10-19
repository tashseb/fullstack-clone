require 'csv'
require_relative '../models/customer'
class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1
    loaded_customers if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end

  def find(customer_id)
    @customers.find { |client| client if client.id == customer_id }
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_customer
  end

  private

  def loaded_customers
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |customers|
      customers[:id] = customers[:id].to_i
      @customers << Customer.new(customers)
    end
    @next_id = @customers.any? ? @customers.last.id + 1 : 1
  end

  def save_customer
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
