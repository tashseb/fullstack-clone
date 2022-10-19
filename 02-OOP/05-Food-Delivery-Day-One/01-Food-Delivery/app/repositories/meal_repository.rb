require 'csv'
require_relative 'base_repository'
require_relative '../models/meal'
class MealRepository #< BaseRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    loaded_meals if File.exist?(@csv_file_path)
  end
  # def build_record(attributes)
  #   attributes[:id] = attributes[:id].to_i
  #   attributes[:price] = attributes[:price].to_i
  #   @elements << Meal.new(attributes)
  # end

  def all
    @meals
  end

  def find(meal_id)
    @meals.find { |dish| dish if dish.id == meal_id }
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_meal
  end

  private

  def loaded_meals
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i
      attributes[:price] = attributes[:price].to_i
      # need to turn customer_id into an instance of customer
      # @customer_repository
      @meals << Meal.new(attributes)
    end
    @next_id = @meals.any? ? @meals.last.id + 1 : 1
  end

  def save_meal
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << Meal.header
      @meals.each do |meal|
        csv << meal.build_row
      end
    end
  end
end



# check = MealRepository.new('/Users/tashikacruz/code/tashseb/fullstack-challenges/02-OOP/05-Food-Delivery-Day-One/01-Food-Delivery/data/meals.csv')
# p check.loaded_records
