def fizz_buzz(number)
  # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
  result = []
  i = 1
  @number = number

  while i <= number
    text = ""
    text += "Fizz" if i % 3 == 0
    text += "Buzz" if i % 5 == 0
    if text.empty?
      result << i
    else
      result << text
    end
    i += 1
  end

  raise ArgumentError, "Argument must be greater than one" unless @number > 1

  return result
end
