require_relative 'base_view'
class OrdersView < BaseView
  # def initialize
  #   @meal
  # end

  def order_delivered
    puts "What order have you delivered? Enter index"
    print ">"
    gets.chomp.to_i - 1
  end

  def display_undelivered(orders)
    orders.each_with_index do |attribute, index|
      puts "#{index + 1} #{attribute.meal.name}. Customer: #{attribute.customer.name} Rider: #{attribute.employee.username}"
    end
  end

end
