require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    recipe_name = @view.add_new_dish
    recipe_descp = @view.add_new_description
    recipe = Recipe.new(recipe_name, recipe_descp)
    @cookbook.add_recipe(recipe)
    display_recipes
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_user_for_index
    @cookbook.remove_recipe(recipe_index)
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
  end
end
