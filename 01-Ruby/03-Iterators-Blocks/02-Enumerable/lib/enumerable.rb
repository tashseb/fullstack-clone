def sum_odd_indexed(array)
  sum = 0
  array.each_with_index { |item, index| sum += item if index.odd? }
  sum
end

def even_numbers(array)
  array.select { |num| num.even? }
end

def short_words(array, max_length)
  # TODO: Take an array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
  array.reject { |word| word if word.size > max_length }
end

def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
  array.find { |number| number if number < limit }
end

def add_bang(array)
  array.map { |string| "#{string}!" }
end

def concatenate(array)
  # ["hello", " ", "all", ",", " ", "how", " ", "are", " ", "you", "?"]
  # "hello all, how are you?" empty elements
  array.reduce { |memo, obj| memo if obj != " " }
  array.join
end

def sorted_pairs(array)
  # ["say" "my" "name" "say" "my" "name"]
  # [["my", "say"],["name", "say"], ["my", "name"]]
  result = []
  array.each_slice(2) { |value| result << value.sort }
  result
end
