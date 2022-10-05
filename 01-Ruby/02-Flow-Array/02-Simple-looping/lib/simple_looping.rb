def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  sum = 0
  sum = -1 if min > max
  for num in (min..max).to_a
    sum += num
  end
  sum
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  sum = 0
  counter = 0
  num = (min..max).to_a
  sum = -1 if min > max
  while counter != num.count
    sum += num[counter]
    counter += 1
  end
  sum
end
