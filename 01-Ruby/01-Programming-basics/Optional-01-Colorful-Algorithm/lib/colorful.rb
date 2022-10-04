def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  num = number.to_s.scan(/./).map { |e| e.to_i }

  if num.length <= 3
    r = color[0] * color[1]
    g = color[1] * color[-1]
    b = r * color[-1]
  else
    return false
  end
end
