def circle_area(radius)
  result = 0
  if radius.negative?
    result
  else
    result = 3.14 * radius * radius
  end
  return result
end
