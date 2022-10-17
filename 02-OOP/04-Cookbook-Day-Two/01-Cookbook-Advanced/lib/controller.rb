require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'
require_relative 'scrape_allrecipes_services'
require "nokogiri"
require "open-uri"

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
    recipe_rating = @view.add_rating
    recipe_prep = @view.add_prep_time
    create_recipe(recipe_name, recipe_descp, recipe_rating, recipe_prep)
    display_recipes
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_user_for_index
    @cookbook.remove_recipe(recipe_index)
  end

  def search
    search_ingredient = @view.ask_ingredient_to_find
    scraped_recipe = ScrapeAllrecipesServices.new(search_ingredient).call
    @view.display_list(scraped_recipe)
    index = @view.ask_recipe_to_import
    @cookbook.add_recipe(scraped_recipe[index])
  end

  def done
    display_recipes
    @cookbook.marked_recipe(@view.ask_mark_recipe)
  end

  def create_recipe(name, decription, rating, prep_time)
    new_recipe = Recipe.new(name, decription, rating, prep_time)
    @cookbook.add_recipe(new_recipe)
  end

  private

  def display_recipes
    @view.display_list(@cookbook.all)
  end
end
