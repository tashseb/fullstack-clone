def fizz_buzz(number)
  # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
  # returns an array of one if 'number' is one

  return [1] if number == 1
  raise ArgumentError, "Argument must be greater than one" unless number > 1

  result = []
  i = 1

  while i <= number
    text = ""
    text += "Fizz" if (i % 3).zero?
    text += "Buzz" if (i % 5).zero?
    if text.empty?
      result << i
    else
      result << text
    end
    i += 1
  end
  return result
end
