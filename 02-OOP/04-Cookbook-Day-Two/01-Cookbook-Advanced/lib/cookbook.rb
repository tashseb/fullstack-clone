require "csv"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(csv_file_path) do |recipe|
      recipe = Recipe.new(recipe[0], recipe[1], recipe[2], recipe[3])
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def marked_recipe(index)
    @recipes[index].mark_as_done!
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time]
      end
    end
  end
end
