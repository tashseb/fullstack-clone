require_relative 'base_view'
class MealsView < BaseView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}.)-> ID: #{meal.id} #{meal.name} $#{meal.price} "
    end
  end

  def add_name
    puts "Please add a new NAME"
    gets.chomp
  end

  def add_price
    puts "Please add the PRICE of the meal"
    gets.chomp.to_i
  end

  def find_by_id
    puts "Please input the number of meal you want to find."
    gets.chomp.to_i
  end
end
