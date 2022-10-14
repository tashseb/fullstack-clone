require "csv"

filepath = "/Users/tashikacruz/code/tashseb/fullstack-challenges/02-OOP/03-Cookbook-Day-One/02-Cookbook/lib/"

csv_file_path = CSV.foreach(filepath) { |row| "#{row[0]} #{row[1]}"}

class Cookbook

  def initialize(csv_file_path = [])
    @recipe = csv_file_path
  end

  def all
    @recipe
  end

  def add_recipe(recipe)
    @recipe << recipe
  end

  def remove_recipe(recipe_index)
    @recipe.delete_at(recipe_index)
  end
end
