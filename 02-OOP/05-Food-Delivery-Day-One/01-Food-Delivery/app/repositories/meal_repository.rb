class MealRepository
  def initialize(csv_file_path)
    if File.exist?(csv_file_path)
      @csv_file_path = csv_file_path
    else
      @csv_file_path = '/Users/tashikacruz/code/tashseb/fullstack-challenges/02-OOP/05-Food-Delivery-Day-One/01-Food-Delivery/data/meals.csv'
    end
    @meal = []
    load_csv
  end

  def all
    @meal
  end

  def create(meal_id)
    @meal << meal
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row,
      header_converters: :symbol) do |attributes|
      @meal << Meal.new(attributes)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meal.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
