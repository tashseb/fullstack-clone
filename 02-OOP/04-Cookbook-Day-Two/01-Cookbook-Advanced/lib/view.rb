class View
  def initialize
    @import_recipe = ""
  end

  def display_list(recipe)
    puts ""
    recipe.each_with_index do |dish, index|
      puts "#{index + 1}.)[#{dish.done? ? 'X' : ' '}]#{dish.name} (#{dish.rating}/5) #{dish.prep_time} - #{dish.description}"
    end
  end

  def display_result(result)
    puts ""
    puts "Looking for #{@import_recipe} recipes on the internet..."
    sleep(1)
    puts ""
    result.each_with_index { |recipe, index| puts "#{index + 1}.)#{recipe}" }
  end

  def add_new_dish
    puts ""
    puts "What is the dish name?"
    return gets.chomp
  end

  def add_new_description
    puts "What is the description?"
    return gets.chomp
  end

  def add_rating
    puts "What is the rating?"
    gets.chomp
  end

  def add_prep_time
    puts "How long is the prep time?"
    gets.chomp
  end

  def ask_user_for_index
    puts ""
    puts "Which number do you want to delete?"
    return gets.chomp.to_i - 1
  end

  def ask_ingredient_to_find
    puts ""
    puts "What ingredient would you like a recipe for"
    @import_recipe = gets.chomp
  end

  def ask_recipe_to_import
    puts ""
    puts "Which recipe would you like to import (enter number)"
    # puts "Importing #{@import_recipe}..."
    return gets.chomp.to_i - 1
  end

  def ask_mark_recipe
    puts ""
    puts "Which recipe you want to MARK (enter number)?"
    return gets.chomp.to_i - 1
  end
end
