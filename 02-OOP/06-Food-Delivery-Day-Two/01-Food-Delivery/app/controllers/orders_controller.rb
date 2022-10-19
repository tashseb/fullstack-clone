require_relative '../views/orders_view'
require_relative '../models/order'
require_relative 'meals_controller'
require_relative 'customers_controller'
require_relative 'employees_controller'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new

    @meals_controller = MealsController.new(@meal_repository)
    @customers_controller = CustomersController.new(@customer_repository)
    @employees_controller = EmployeesController.new(@employee_repository)
  end

  def add
    p @meals_controller.list
    meal_index = @view.ask_for('Meal number').to_i - 1
    @customers_controller.list
    customer_index = @view.ask_for('Customer number').to_i - 1
    @employees_controller.list
    employee_index = @view.ask_for('Employee number').to_i - 1
    meal = @meal_repository.all[meal_index]
    customer = @customer_repository.all[customer_index]
    employee = @employee_repository.all_riders[employee_index]
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
    list_undelivered_orders
  end

  def list_my_orders(employee)
    order = @order_repository.list_orders_by_emp(employee)
    @view.display_undelivered(order)
  end

  def mark_as_delivered(employee)
    order_index = @view.order_delivered
    rider_orders = @order_repository.list_orders_by_emp(employee)
    order = rider_orders[order_index]
    @order_repository.mark_as_delivered(order)
  end

  def list_undelivered_orders
    @view.display_undelivered(@order_repository.undelivered_orders)
  end
end
