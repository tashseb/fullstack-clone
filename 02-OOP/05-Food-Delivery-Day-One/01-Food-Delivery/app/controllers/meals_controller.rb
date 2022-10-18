require_relative '../views/meals_view'
require_relative '../models/meal'
require_relative '../repositories/meal_repository'

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    display_list
  end

  def add
    name = @meals_view.add_name
    price = @meals_view.add_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  def find
    display_list
    meal_id = @meals_view.find_by_id
    @meals_view.display_meal(@meal_repository.find(meal_id))
  end

  private

  def display_list
    @meals_view.display_meal(@meal_repository.all)
  end
end
