require 'csv'
require_relative '../models/order'
# require_relative '..models/meal'
# require_relative '..models/customer'
# require_relative '..models/employee'
class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_path = orders_csv_path
    @orders = []
    @next_id = 1
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    load_orders if File.exist?(@orders_csv_path)
  end

  def all
    @orders
  end

  def create(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_order
  end

  def mark_as_delivered(order)
    order.deliver!
    save_order
  end

  def undelivered_orders
    @orders.select { |order| order.delivered == false }
  end

  def list_orders_by_emp(employee)
    @orders.select { |order| order.employee == employee && !order.delivered? }
  end

  def load_orders
    CSV.foreach(@orders_csv_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i
      attributes[:delivered] = attributes[:delivered] == 'true'

      meal = @meal_repository.find(attributes[:meal_id].to_i)
      customer = @customer_repository.find(attributes[:customer_id].to_i)
      employee = @employee_repository.find(attributes[:employee_id].to_i)

      attributes[:meal] = meal
      attributes[:customer] = customer
      attributes[:employee] = employee

      @orders << Order.new(attributes)
    end
    @next_id = @orders.any? ? @orders.last.id + 1 : 1
  end

  def save_order
    CSV.open(@orders_csv_path, 'wb') do |csv|
      csv << Order.header
      @orders.each do |order|
        csv << order.build_row
      end
    end
  end
end
