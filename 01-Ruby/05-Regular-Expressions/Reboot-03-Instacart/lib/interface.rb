# TODO: you can build your instacart program here!
items = {
  'dragon fruit' => { price: 800, quantity: 5 },
  'kiwi' => { price: 300, quantity: 4 },
  'durian' => { price: 1000, quantity: 1 },
  'banana' => { price: 100, quantity: 5 },
  'horse' => { price: 1500, quantity: 5 }
}
# 3. Get items from the user (shopping)
# 3.1 Ask Which item? (or 'quit' to checkout)
# 3.2 Ask how many items?
# 3.3 Prompt if user gave an item not on the list
# 4. Print the bill (checkout)
# -------BILL---------
# > kiwi: 2 X 1.25€ = 2.5€
# > mango: 3 X 4€ = 12€
# > TOTAL: 14.5€
# > --------------------
# items = {
#   'dragon fruit' => 800,
#   'kiwi' => 300,
#   'durian' => 1000,
#   'banana' => 100,
#   'horse' => 1500
# }
cart = {}
subtotal = 0
total = 0
choice = nil
puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"
# 2. Define your store (what items are for sale?) Print all the items
puts "In our store today:"
items.each do |name, presyo|
  puts "#{name}: #{presyo[:price]}¥ (#{presyo[:quantity]} available)"
end
puts "-------------------"

until choice == 'quit'
  puts "Which item? (or 'quit' to checkout)"
  choice = gets.chomp
  store_quantity = items[choice['quantity']]

  if items.key?(choice)
    puts "How many?"
    quantity = gets.chomp.to_i
    # adding item to the cart
    cart[choice] = quantity
  else
    puts "Sorry, we don't have #{choice} today." unless choice == 'quit'
  end
end

puts " -------BILL---------"
cart.each do |fruit, count|
  subtotal = items[fruit][:price] * count
  total += subtotal
  puts "#{fruit}: #{count} X #{items[fruit][:price]} = #{subtotal}"
end
puts "TOTAL: #{total}¥"
puts "-------------------"
