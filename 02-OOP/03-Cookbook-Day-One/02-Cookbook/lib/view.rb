class View
  def display_list(recipe)
    recipe.each do |dish|
      puts "(/.*(#{dish.name}).*/"
    end
  end

  def add_new_dish
    puts "What is the dish name?"
    return gets.chomp
  end

  def add_new_description
    puts "What is the description?"
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    return gets.chomp.to_i
  end
end
