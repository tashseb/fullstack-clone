require_relative "burger_restaurant"


puts "Please choose a patty: steak, chicken and fish"
patty = gets.chomp

puts "Please select a sauce:"
sauce = gets.chomp

puts "Please select a topping:"
topping = gets.chomp

burger(patty, sauce, topping)

puts "💬 I'd like a burger with a bigger portion of fish, plus mayo and salad please."
# TODO: to upgrade a portion to a bigger one, transform the fish to uppercase
bigger_burger = burger(patty.upcase, sauce, topping)


puts "💬 I'd like a juicy steak with barbecue sauce and cheddar please."
# TODO: to make a juicy steak, replace any vowel by the sign "~"
juicy_burger = burger(patty, sauce, topping)


puts "💬 I'd like a spicy chicken with ketchup and cheddar please."
# TODO: to make a spicy portion, add the sign "*" before and after the string
# spicy_burger =























# DO NOT remove this line, written for testing purpose
@variables = (local_variables.collect { |v| [v, binding.local_variable_get(v)] }).to_h
