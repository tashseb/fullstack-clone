require_relative "burger_restaurant"


puts "💬 I'd like a burger with a bigger portion of fish, plus mayo and salad please."
# TODO: to upgrade a portion to a bigger one, transform the fish to uppercase
bigger_burger = burger("fish", "mayo", "salad")
burger("fish".upcase, "mayo", "salad")


puts "💬 I'd like a juicy steak with barbecue sauce and cheddar please."
# TODO: to make a juicy steak, replace any vowel by the sign "~"
juicy_burger = burger("steak".gsub(/[aeiou]/, "~"), "barbecue", "cheddar")

puts "💬 I'd like a spicy chicken with ketchup and cheddar please."
# TODO: to make a spicy portion, add the sign "*" before and after the string
spicy_burger = burger("chicken", "ketchup", "cheddar")























# DO NOT remove this line, written for testing purpose
@variables = (local_variables.collect { |v| [v, binding.local_variable_get(v)] }).to_h
