MENU = {
  'Hamburger' => 250,
  'Cheese Burger' => 300,
  'Veggie Burger' => 540,
  'Vegan Burger' => 350,
  'Sweet Potatoes' => 230,
  'Salad' => 15,
  'Iced Tea' => 70,
  'Lemonade' => 90
}
MEALS = {
  'Cheesy Combo' => ['Cheese Burger', 'Sweet Potatoes', 'Lemonade'],
  'Veggie Combo' => ['Veggie Burger', 'Sweet Potatoes', 'Iced Tea'],
  'Vegan Combo' => ['Vegan Burger', 'Salad', 'Lemonade']
}

def poor_calories_counter(burger, side, beverage)
  # TODO: return number of calories for this restaurant order
  MENU[burger] + MENU[side] + MENU[beverage]
end
