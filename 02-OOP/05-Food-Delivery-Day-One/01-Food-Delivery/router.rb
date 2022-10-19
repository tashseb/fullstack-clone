class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    puts "Welcome to Food Delivery!"
    puts "           --           "
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.manager?
          display_manager_tasks
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_rider_tasks
          action = gets.chomp.to_i
          print `clear`
          route_rider_action(action)
        end
      end
    end
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then logout
    when 6 then stop
    else
      puts "Please select 1, 2, 3, 4, 5, or 6 "
    end
  end

  def route_rider_action(action)
    case action
    # when 1 then @meals_controller.list
    # when 2 then @meals_controller.add
    # when 3 then @customers_controller.list
    # when 4 then @customers_controller.add
    when 9 then logout
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4, 5 or 0"
    end
  end

  def logout
    @employee = nil
  end

  def stop
    @employee = nil
    @running = false
  end

  def display_manager_tasks
    puts ""
    puts "What would you like to do?"
    puts "1. List all meals"
    puts "2. Add new meal"
    puts "3. Find a meal by meal_id"
    puts "4. List all customers"
    puts "5. Add new customer"
    puts "6. Find customer by ID"
    puts "7. Exit"
  end

  def display_rider_tasks
    puts ""
    puts "What do you want to do next?"
    # puts "1 - List all meals"
    # puts "2 - Create a new meal"
    # puts "3 - List all customers"
    # puts "4 - Create a new customer"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end
end
