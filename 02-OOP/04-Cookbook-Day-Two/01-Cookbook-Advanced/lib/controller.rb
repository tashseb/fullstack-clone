require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'
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
    create_recipe(recipe_name, recipe_descp)
    display_recipes
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_user_for_index
    @cookbook.remove_recipe(recipe_index)
  end

  def search
    # file = "banana.html"
    # doc = Nokogiri::HTML(File.open(file), nil, "utf-8")
    search_ingredient = @view.ask_ingredient_to_find
    html_content = URI.open("https://www.allrecipes.com/search?q=#{search_ingredient}", "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
    doc = Nokogiri::HTML(html_content)
    recipe = []

    doc.search(".card__content .card__title").first(5).map do |element|
      recipe << element.text.strip
    end
    import_recipe(recipe)
  end

  def import_recipe(search_result)
    @view.display_result(search_result)
    import_result = @view.ask_recipe_to_import
    create_recipe(search_result[import_result], "")
    display_list
  end

  def create_recipe(name, decription)
    new_recipe = Recipe.new(name, decription)
    @cookbook.add_recipe(new_recipe)
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
  end
end
