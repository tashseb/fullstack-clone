def calculate(first_number, second_number, operator)
  case operator
  when "+" then first_number + second_number
  when "-" then first_number - second_number
  when "*" then first_number * second_number
  when "/" then first_number / second_number
  else
    puts "Wrong operator"
  end
end
