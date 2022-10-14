require "csv"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(csv_file_path) do |recipe|
      recipe = Recipe.new(recipe[0], recipe[1])
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |dish|
        csv << [dish.name, dish.description]
      end
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
