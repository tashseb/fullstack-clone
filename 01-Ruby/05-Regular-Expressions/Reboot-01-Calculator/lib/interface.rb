require_relative "calculator"
# TODO: you can build your calculator program here!
answer = nil
until answer == 'N'
  puts "Enter a first number:"
  first_num = gets.chomp.to_f
  puts "Enter a second number:"
  second_num = gets.chomp.to_f
  puts "Which operation [+][-][x][/]"
  operator = gets.chomp

  puts "Result : #{calculate(first_num, second_num, operator)}"
  puts "Do you want to calculate again? [Y/N]"
  answer = gets.chomp
  answer == "Y" ? answer = "Y" : answer = "N"
end
