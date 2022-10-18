require_relative 'router'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'


csv_file = File.join(__dir__, 'data/meals.csv')
customer_csv_file = File.join(__dir__, 'data/customers.csv')
meal_repository = MealRepository.new(csv_file)
customer_repository = CustomerRepository.new(customer_csv_file)
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomerController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

# Start the app
router.run
