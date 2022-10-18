class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    # @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Food Delivery App"
    puts "-" * 15
    while @running
      display_options
      choice = gets.chomp.to_i
      # print 'clear'
      route_action(choice)
    end
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.find
    when 4 then @customers_controller.list_customer
    when 5 then @customers_controller.add_customer
    when 6 then stop
    else
      puts "Please select 1, 2, 3, 4, 5 or 6"
    end
  end

  def stop
    @running = false
  end

  def display_options
    puts ""
    puts "What would you like to do?"
    puts "1. List all meals"
    puts "2. Add new meal"
    puts "3. Find a meal by meal_id"
    puts "4. List all customers"
    puts "5. Add new customer"
    puts "6. Exit"
  end
end
