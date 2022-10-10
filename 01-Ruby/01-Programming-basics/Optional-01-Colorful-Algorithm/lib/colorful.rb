def colorful?(number)
  product = []
  if number.instance_of? Integer
    nums = number.to_s.chars.map { |numero| numero.to_i }
    if nums.length == 1 || nums == 23
      result true
    else
      nums.map.with_index do |num, index|
        index == 2 ? product << (num * nums[0] * nums[1]) : product << (num * nums[index + 1])
        index - 1
      end
      nums & product == []
    end
  else
    false
  end
end
