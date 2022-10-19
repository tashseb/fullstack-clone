class CustomersView
  def display_customer(customers)
    customers.each_with_index do |attribute, index|
      puts "#{index + 1}.)-> ID: #{attribute.id} #{attribute.name} lives at #{attribute.address} "
    end
  end

  def add_name
    puts "Please add the customer's name"
    gets.chomp
  end

  def add_address
    puts "Please add the customer's address"
    gets.chomp
  end

  def find_customer_by_id
    puts "Please input the ID of the customer you want to find."
    gets.chomp.to_i
  end
end
