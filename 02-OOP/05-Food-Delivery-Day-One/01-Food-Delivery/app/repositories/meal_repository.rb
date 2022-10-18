require 'csv'
class MealRepository
  #pass customer_repository(csv_file_path, customer_repository)
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    loaded_meals if File.exist?(@csv_file_path)
  end

  def all
    @meals
  end

  def find(meal_id)
    meal_found = nil
    @meals.each { |dish| meal_found = dish if dish.id == meal_id }
    meal_found
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_meal
  end

  private

  def loaded_meals
    CSV.foreach(@csv_file_path, headers: :first_row,
      header_converters: :symbol) do |attributes|
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
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
