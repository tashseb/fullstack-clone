def burger(patty, sauce, topping)
  # TODO: code the `burger` method
  finished_burger = []
  finished_burger[0] = "bread"
  finished_burger[1] = patty
  finished_burger[2] = sauce
  finished_burger[3] = topping
  finished_burger[4] = "bread"
  yield(patty, sauce, topping) if block_given?
  finished_burger
end

burger('steak', 'ketchup', 'onions') do |patty|
  "grilled #{patty}"
end
