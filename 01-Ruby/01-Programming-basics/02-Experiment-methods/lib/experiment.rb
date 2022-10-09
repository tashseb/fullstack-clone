# Warning:
# - One line of code for each method
# - Just look in the doc for the right method of the String, Integer, and Array classes!

def get_rid_of_surrounding_whitespaces(a_string)
  return a_string.strip
end

def belongs_to?(a_string, a_word)
  a_string.split.include?(a_word)
end

def replace(initial_string, old_letter, new_letter)
  initial_string.gsub(old_letter, new_letter)
end

def exactly_divide(an_integer, a_divider)
  an_integer / a_divider.to_f
end

def divisible_by_two?(an_integer)
  an_integer % 2 ? an_integer.even? : an_integer.odd?
end

def random_subset(an_array, sample_size)
  an_array.sample(sample_size)
end

def randomize(an_array)
  an_array.sample(an_array.size)
end

def ascending_order(an_array)
  an_array.sort
end
