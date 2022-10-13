# DO NOT remove the line below, written for display purpose
require_relative "../spec/helper/board"

require_relative "rice"
require_relative "corn"
require_relative "cow"
require_relative "chicken"

# Display the state of the farm (move the line below in the loop when asked)
Board.new.display

choice = nil
until choice == 'quit'
  puts "Pick an action: [corn | rice | water | cow | chicken | feed | quit]"
  choice = gets.chomp

  case choice
  when 'corn'
    puts "Let's plant corn crops!"
    corn = Corn.new
  when 'rice'
    puts 'Rice crops today!'
    rice = Rice.new
  when 'water'
    corn.water!
    rice.water!
    puts 'something'
  when 'quit'
    puts 'See you next time'
  else
    puts "I don't know what you mean..."
  end
end
