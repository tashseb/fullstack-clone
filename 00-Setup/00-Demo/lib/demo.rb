def circle_area(radius)
  if radius.negative?
    return 0
  else
    return 3.14 * radius * radius
  end
end

puts circle_area(5)
