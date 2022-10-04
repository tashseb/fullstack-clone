def fizz_buzz(number)
  # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
  result = []
  i = 1
  @number = number

  while i <= number
    text = ""
    text += "Fizz" if i % 3.zero?
    text += "Buzz" if i % 5.zero?
    text = i if text.empty?

    result.push(text)
    i += 1
  end
  raise ArgumentError, "Argument must be greater than one" unless @number > 1

  return result
end
